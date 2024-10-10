# Contributor: Mateusz Galazyn <carbolymer at gmail.com>

pkgrel=1
pkgver=r682.84c59ed
pkgname=zsh-zim-git
pkgdesc="ZIM - Zsh IMproved"
url="https://github.com/zimfw/zimfw"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git' 'patch')
optdepends=('otf-powerline-symbols-git: for eriner prompt')
source=('git+https://github.com/zimfw/zimfw.git'
        'git+https://github.com/zimfw/install.git'
        'zim.install'
        'zimfw.zsh.patch'
        'zshrc')
md5sums=('SKIP'
         'SKIP'
         'd63ab2a0308488aa4d7ffc817a2106d7'
         '71ad8df0120ee595ef7330e66951f49d'
         '0cb8764ba7f67c37c3c6452cc06751af')
options=('!strip')
install='zim.install'
_gitname='zimfw'
backup=('etc/zsh/zimrc' 'etc/zsh/zshrc')

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

  rcfiles=('zshrc' 'zimrc')
  for entry in "${rcfiles[@]}"; do
    cp -L "${srcdir}/install/src/templates/${entry}" $ZIM_TPL_DIR
  done
  cp ${srcdir}/$_gitname/zimfw.zsh ${pkgdir}/usr/lib/zim/
  # correct ZIM_HOME in the template
  sed -i "s#^ZIM_HOME=.*#ZIM_HOME=/usr/lib/zim#" "$ZIM_TPL_DIR/zshrc"

  # zimfw.zsh generates hardcoded reference to .zimrc, so for packaging purpose we fake it
  ( cd $ZIM_TPL_DIR ; ln -s ./zimrc .zimrc )
  export ZDOTDIR=$ZIM_TPL_DIR
  export ZIM_HOME=${pkgdir}/usr/lib/zim
  zsh ${ZIM_HOME}/zimfw.zsh install
  rm "${ZIM_TPL_DIR}/.zimrc"

  # Prepare /etc/zsh/ contents
  mkdir -p $pkgdir/etc/zsh
  cp -f $ZIM_TPL_DIR/zimrc $pkgdir/etc/zsh/zimrc
  cp -f zshrc "$pkgdir/etc/zsh/zshrc"

  # patch zwc file with hardcoded paths
  patching=('init.zsh')
  # use ${HOME} in needle used in patching
  pkgdir_replaced_home="${pkgdir/$HOME/\${HOME\}}"  
  for entry in "${patching[@]}"; do
    echo "Patching build paths occurrence in: ${entry}"
    sed -i "s/${pkgdir_replaced_home//\//\\/}//g" "${ZIM_HOME}/${entry}"
  done
  ( cd "${ZIM_HOME}" && patch < "${startdir}/zimfw.zsh.patch" )
  find ${ZIM_HOME} -iname "*.old" -type f -exec rm -f \{\} \;
  # files will be recompiled during installation, when zsh will be executed as root
  find ${ZIM_HOME} -iname "*.zwc" -type f -exec rm -f \{\} \;
  find "${ZIM_HOME}" ! -type l -execdir chmod u+rX,g+rX,o+rX {} \;
}


