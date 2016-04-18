# Maintainer: Erik Beran <eberan AT_gmail_DOT com>
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

_CLANG_LIB_FILENAME="libclang.so.3.8"
_CLANG_VERSION="3.8.0"
_CLANG_URL="http://llvm.org/releases/${_CLANG_VERSION}"
_CLANG_DIRNAME="clang+llvm-${_CLANG_VERSION}-x86_64-linux-gnu-ubuntu-14.04"
_CLANG_FILENAME="${_CLANG_DIRNAME}.tar.xz"

pkgname=vim-youcompleteme-git
pkgver=1774.f67033c
pkgver() {
  cd "YouCompleteMe"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=1
pkgdesc="A code-completion engine for Vim"

arch=('i686' 'x86_64')
url='http://valloric.github.com/YouCompleteMe/'
license=('GPL3')
groups=('vim-plugins')
depends=('boost' 'boost-libs' 'libtinfo-5' 'mono' 'nodejs' 'python' 'python2' 'rust' 'vim')
# use system's libclang on non-x86_64 architectures
[[ "${CARCH}" != 'x86_64' ]] && depends+=('clang')
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
if [[ "${CARCH}" == 'x86_64' ]]; then
  # use bundled libclang on x86_64
  source+=("${_CLANG_URL}/${_CLANG_FILENAME}"{,.sig})
  sha256sums+=('3120c3055ea78bbbb6848510a2af70c68538b990cb0545bac8dad01df8ff69d7'
               '7cc55f1a1cc3e5478581e66c79ffa5ab4d7495076e6164b52d7b1a63816751a7')
  validpgpkeys=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D')
  noextract=("${_CLANG_FILENAME}")
  _COMPLETER="USE_CLANG_COMPLETER"
else
  # use system's libclang on non-x86_64
  depends+=('clang')

  # YCM works best with bundled libclang, but bundled libclang is only
  # for x86_64 machines
  # from ycmd source: cpp/ycm/CMakeLists.txt
  # Clang 3.3 is the last version with pre-built x86 binaries upstream.
  # That's too old now.
  _COMPLETER="USE_SYSTEM_LIBCLANG"
fi
install=install

prepare() {
  msg2 'Setting up Git submodules...'

  cd "$srcdir/YouCompleteMe"
  git submodule init
  git config submodule.third_party/requests-futures.url "$srcdir/requests-futures"
  git config submodule.third_party/ycmd.url "$srcdir/ycmd"
  git submodule update

  cd "$srcdir/YouCompleteMe/third_party/ycmd"
  git submodule init
  git config submodule.third_party/argparse.url "$srcdir/argparse"
  git config submodule.third_party/bottle.url "$srcdir/bottle"
  git config submodule.third_party/frozendict.url "$srcdir/python-frozendict"
  git config submodule.third_party/python-future.url "$srcdir/python-future"
  git config submodule.third_party/JediHTTP.url "$srcdir/JediHTTP"
  git config submodule.third_party/waitress.url "$srcdir/waitress"
  git config submodule.third_party/gocode.url "$srcdir/gocode"
  git config submodule.third_party/godef.url "$srcdir/godef"
  git config submodule.third_party/OmniSharpServer.url "$srcdir/OmniSharpServer"
  git config submodule.third_party/requests.url "$srcdir/requests"
  git config submodule.third_party/racerd.url "$srcdir/racerd"
  git submodule update

  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/JediHTTP"
  git submodule init
  git config submodule.vendor/argparse.url "$srcdir/argparse"
  git config submodule.vendor/waitress.url "$srcdir/waitress"
  git config submodule.vendor/jedi.url "$srcdir/jedi"
  git config submodule.vendor/bottle.url "$srcdir/bottle"
  git submodule update

  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer"
  git submodule init
  git config submodule.NRefactory.url "$srcdir/NRefactory"
  git config submodule.cecil.url "$srcdir/cecil"
  git submodule update

  if [[ "${CARCH}" == 'x86_64' ]]; then
    msg2 'Setting up bundled libclang...'
    mkdir -p "$srcdir/YouCompleteMe/third_party/ycmd/clang_archives"
    cp "$srcdir/${_CLANG_FILENAME}" \
      "$srcdir/YouCompleteMe/third_party/ycmd/clang_archives"
  fi
}

build() {
  # https://github.com/Valloric/ycmd/blob/master/build.py {{{

  msg2 'Building ycmd...' # BuildYcmdLibs()
  mkdir -p "$srcdir/ycmd_build"
  cd "$srcdir/ycmd_build"
  cmake -G "Unix Makefiles" -D${_COMPLETER}=1 . "$srcdir/YouCompleteMe/third_party/ycmd/cpp"
  make ycm_core

  msg2 'Building OmniSharp completer...' # BuildOmniSharp()
  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer"
  pwd
  xbuild /property:Configuration=Release

  msg2 'Building Gocode completer...' # BuildGoCode()
  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/gocode"
  pwd
  go build
  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/godef"
  pwd
  go build

  msg2 'Building Rust completer...' # BuildRacerd()
  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/racerd"
  pwd
  cargo build --release

  msg2 'Building Tern completer...' # SetUpTern()
  cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/tern_runtime"
  pwd
  npm install --production --python=python2
  # }}}
}

package() {
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/OmniSharpServer/OmniSharp/bin/Release"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/gocode"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/godef"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/racerd/target/release"

  cp -r "$srcdir/YouCompleteMe/"{autoload,doc,plugin,python} \
    "$pkgdir/usr/share/vim/vimfiles"
  cp -r "$srcdir/YouCompleteMe/third_party/"{pythonfutures,requests-futures,retries} \
    "$pkgdir/usr/share/vim/vimfiles/third_party"
  cp -r "$srcdir/YouCompleteMe/third_party/ycmd/"{ycmd,ycm_core.so,check_core_version.py,CORE_VERSION} \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd"

  if [[ "${_COMPLETER}" == "USE_CLANG_COMPLETER" ]]; then
    cp "$srcdir/ycmd_build/${_CLANG_DIRNAME}/lib/${_CLANG_LIB_FILENAME}" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd"
    cp -r "$srcdir/YouCompleteMe/third_party/ycmd/clang_includes" \
      "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/clang_includes"
  fi

  cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/"{argparse,bottle,frozendict,JediHTTP,python-future,requests,tern_runtime,waitress} \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party"

  cp    "$srcdir/YouCompleteMe/third_party/ycmd/third_party/gocode/gocode" \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/gocode/gocode"
  cp    "$srcdir/YouCompleteMe/third_party/ycmd/third_party/godef/godef" \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/godef/godef"
  cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer/OmniSharp/bin/Release" \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/OmniSharpServer/OmniSharp/bin"
  cp    "$srcdir/YouCompleteMe/third_party/ycmd/third_party/racerd/target/release/racerd" \
    "$pkgdir/usr/share/vim/vimfiles/third_party/ycmd/third_party/racerd/target/release/racerd"

  find "$pkgdir" -name .git -exec rm -fr {} +
}

# vim:set ts=2 sw=2 et:
