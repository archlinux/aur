# Maintainer: Jan-Tarek Butt <tarek AT ring0 DOT de>
# Contributor: Erik Beran <eberan AT gmail DOT com>
# Contributor: Thor K. H. <thor at roht dot no>
# Contributor: Babken Vardanyan <483ken 4tgma1l
# Contributor: mikezackles
# Contributor: z33ky
# Contributor: stykr
# Contributor: Svenstaro
# Contributor: KaiSforza
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: shmilee
# Contributor: foobster
# Contributor: archdria
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

###########################################################################################################
#                                          Build Options
###########################################################################################################
_omnisharp="y"

_gocode="y"

_rust="y"

_tern="y"

_completer="ON"

###########################################################################################################

pkgname=vim-youcompleteme-git
pkgver=1963.194ff334
pkgver() {
  cd "YouCompleteMe" || exit
  echo "$(git rev-list --count master).$(git rev-parse --short master)"
}
pkgrel=1
pkgdesc="A code-completion engine for Vim"

arch=('i686' 'x86_64')
url='http://valloric.github.com/YouCompleteMe/'
license=('GPL3')
groups=('vim-plugins')
depends=('boost' 'boost-libs' 'ncurses5-compat-libs' 'mono' 'nodejs' 'python' 'python2' 'rust' 'vim' 'clang')
makedepends=('cargo' 'cmake' 'git' 'go' 'make' 'mono' 'npm')
source=('git+https://github.com/Valloric/YouCompleteMe.git' #ycm
        'git+https://github.com/ross/requests-futures.git'  #ycm
        'git+https://github.com/Valloric/ycmd.git'          #ycm
        'git+https://github.com/kennethreitz/requests.git'  #ycmd
        'git+https://github.com/bewest/argparse.git'        #ycmd
        'git+https://github.com/bottlepy/bottle.git'        #ycmd
        'git+https://github.com/slezica/python-frozendict.git'    #ycmd
        'git+https://github.com/PythonCharmers/python-future.git' #ycmd
        'git+https://github.com/vheon/JediHTTP.git'               #ycmd
        'git+https://github.com/davidhalter/jedi.git'             #jediHTTP
        'git+https://github.com/Pylons/waitress.git'              #ycmd,jediHTTP
        'git+https://github.com/nsf/gocode.git'                   #ycmd
        'git+https://github.com/Manishearth/godef.git'            #ycmd
        'git+https://github.com/nosami/OmniSharpServer.git'       #ycmd
        'git+https://github.com/icsharpcode/NRefactory.git'       #OmniSharpServer
        'git+https://github.com/jbevain/cecil.git'                #OmniSharpServer
        'git+https://github.com/jwilm/racerd.git'                 #ycmd
        )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
install=install

prepare() {
  msg2 'Setting up Git submodules...'

  YouCompleteMe=("requests-futures" "ycmd")
  gitprepare "YouCompleteMe" "third_party/" "${YouCompleteMe[@]}"

  ycmd=("argparse" "bottle" "python-frozendict" "python-future" "JediHTTP" "waitress" "gocode" "godef" "OmniSharpServer" "requests" "racerd")
  gitprepare "YouCompleteMe/third_party/ycmd" "third_party/" "${ycmd[@]}"

  JediHTTP=("argparse" "waitress" "jedi" "bottle")
  gitprepare "YouCompleteMe/third_party/ycmd/third_party/JediHTTP" "vendor/" "${JediHTTP[@]}"

  OmniSharpServer=("NRefactory" "cecil")
  gitprepare "YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer" "" "${OmniSharpServer[@]}"
}

gitprepare() {
  CD_DIR=$1
  GIT_PREFIX=$2
  c=0
  for val in "$@" ; do
    if [ $c -gt 1 ]; then
      FEED[$c]=$val
    fi
    c=$(( c + 1 ))
  done
  cd "$srcdir/$CD_DIR" || exit
  git submodule init
  for GITSUBVAR in "${FEED[@]}" ; do
    git config submodule."$GIT_PREFIX$GITSUBVAR".url "$srcdir/$GITSUBVAR"
  done
  git submodule update
  unset -v FEED
}

build() {
  msg2 'Building ycmd...' # BuildYcmdLibs()
  mkdir -p "$srcdir/ycmd_build"
  cd "$srcdir/ycmd_build" || exit
  cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG="$_completer" . "$srcdir/YouCompleteMe/third_party/ycmd/cpp"
  make ycm_core

  if [ "$_omnisharp" = "y" ]; then
    msg2 'Building OmniSharp completer...' # BuildOmniSharp()
    cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer" || exit
    pwd
    xbuild /property:Configuration=Release
  else
    msg2 'Skipping OmniSharp completer...'
  fi

  if [ "$_gocode" = "y" ]; then
    msg2 'Building Gocode completer...' # BuildGoCode()
    cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/gocode" || exit
    pwd
    go build
    cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/godef" || exit
    pwd
    go build
  else
    msg2 'Skipping Gocode completer...'
  fi

  if [ "$_rust" = "y" ]; then
    msg2 'Building Rust completer...' # BuildRacerd()
    cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/racerd" || exit
    pwd
    cargo build --release
  else
    msg2 'Skipping Rust completer...'
  fi

  if [ "$_tern" = "y" ]; then
    msg2 'Building Tern completer...' # SetUpTern()
    cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/tern_runtime" || exit
    pwd
    npm install --production --python=python2
  else
    msg2 'Skipping Tern completer...'
  fi
}

package() {
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party"

  cp -r "$srcdir/YouCompleteMe/"{autoload,doc,plugin,python} \
    "$pkgdir/usr/share/vim/vimfiles"
  cp -r "$srcdir/YouCompleteMe/third_party/"{pythonfutures,requests-futures,retries} \
    "$pkgdir/usr/share/vim/vimfiles/third_party"
  cp -r "$srcdir/YouCompleteMe/third_party/ycmd/"{ycmd,ycm_core.so,CORE_VERSION,cpp,clang_includes} \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd"
  cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/"{argparse,bottle,frozendict,JediHTTP,python-future,requests,waitress} \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party"

  if [ "$_omnisharp" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/OmniSharpServer/OmniSharp/bin/Release"
    cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer/OmniSharp/bin/Release" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/OmniSharpServer/OmniSharp/bin"
  fi

  if [ "$_gocode" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/gocode"
    mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/godef"
    cp    "$srcdir/YouCompleteMe/third_party/ycmd/third_party/gocode/gocode" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/gocode/gocode"
    cp    "$srcdir/YouCompleteMe/third_party/ycmd/third_party/godef/godef" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/godef/godef"
  fi

  if [ "$_rust" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/racerd/target/release"
    cp    "$srcdir/YouCompleteMe/third_party/ycmd/third_party/racerd/target/release/racerd" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/racerd/target/release/racerd"
  fi

  if [ "$_tern" = "y" ]; then
    cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/tern_runtime" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party"
  fi

  find "$pkgdir" -name .git -exec rm -fr {} +
  rm -rf "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/ycmd/tests"
}
