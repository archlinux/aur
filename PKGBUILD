# Contributor: Mateusz Galazyn <carbolymer at gmail.com>

pkgrel=2
pkgver=r547.3e06f0a
pkgname=zsh-zim-git
pkgdesc="ZIM - Zsh IMproved"
url="https://github.com/zimfw/zimfw"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git' 'rsync')
optdepends=('otf-powerline-symbols-git: for eriner prompt')
source=('git://github.com/zimfw/zimfw.git'
        'git://github.com/zimfw/install.git'
        'zim.install'
        'zshrc')
md5sums=('SKIP'
         'SKIP'
         '6e5ffd11ddfc72d74afb105829821f28'
         '7874908906dbcb5f85bb1ba1d9ab5c00')
options=('!strip')
install='zim.install'
_gitname='zimfw'
backup=('etc/zsh/zlogin' 'etc/zsh/zimrc' 'etc/zsh/zshrc')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_gitname
  git submodule update --init --recursive
}

package() {
  ZIM_TPL_DIR="${pkgdir}/usr/lib/zim/templates"
  mkdir -p $ZIM_TPL_DIR

  rcfiles=('zshenv' 'zshrc' 'zlogin' 'zimrc')
  for entry in "${rcfiles[@]}"; do
    cp -L "${srcdir}/install/src/templates/${entry}" $ZIM_TPL_DIR
  done
  cp ${srcdir}/$_gitname/zimfw.zsh ${pkgdir}/usr/lib/zim/

  # zimfw.zsh generates hardcoded reference to .zimrc, so for packaging purpose we fake it
  ( cd $ZIM_TPL_DIR ; ln -s ./zimrc .zimrc )
  export ZDOTDIR=$ZIM_TPL_DIR
  export ZIM_HOME=${pkgdir}/usr/lib/zim
  zsh ${ZIM_HOME}/zimfw.zsh install
  rm "${ZIM_TPL_DIR}/.zimrc"

  # Prepare /etc/zsh/ contents
  mkdir -p $pkgdir/etc/zsh
  echo "source /usr/lib/zim/templates/zlogin" >> "$pkgdir/etc/zsh/zlogin"
  cp -f $ZIM_TPL_DIR/zimrc $pkgdir/etc/zsh/zimrc
  cp -f zshrc "$pkgdir/etc/zsh/zshrc"

  # patch zwc file with hardcoded paths
  patching=('login_init.zsh' 'init.zsh')
  for entry in "${patching[@]}"; do
    echo "Patching build paths occurrence in: ${entry}"
    sed -i "s/${pkgdir//\//\\/}//g" "${ZIM_HOME}/${entry}"
  done
  find ${ZIM_HOME} -iname "*.old" -type f -exec rm -f \{\} \;
  # files will be recompiled during installation, when zsh will be executed as root
  find ${ZIM_HOME} -iname "*.zwc" -type f -exec rm -f \{\} \;
}


