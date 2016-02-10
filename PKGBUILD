# Maintainer: zfo <zfoofz1@gmail.com>
pkgname=bigdatascript-git
_pkgname=bigdatascript
pkgver=r1.19cfd00
pkgrel=1
pkgdesc="BigDataScript: Scripting language for big data"
url="https://github.com/pcingola/BigDataScript"
arch=('i686' 'x86_64')
license=('APACHE')
makedepends=('git' 'go' 'jdk' 'apache-ant')
source=()
md5sums=()

_gitroot=https://github.com/pcingola/bigdatascript
_gitname=bigdatascript

update_git(){
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin >&2
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname" >&2
  fi

  msg "GIT checkout done or server timeout"
}

pkgver() {
  update_git
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function realpath { echo $(cd $(dirname $1); pwd)/$(basename $1); }

build() {
  cd "${srcdir}/${_gitname}"
  export BDS_HOME="$(realpath ../bds_home)"

  # wrap ant to build everything locally
  mkdir -p $BDS_HOME/.bds
  ant -Duser.home="$BDS_HOME"
  cp $BDS_HOME/.bds/bds.jar $BDS_HOME/bds.jar 
  rm -rf $BDS_HOME/.bds
  
  # now run the rest of the install script
  tail -n +21 scripts/install.sh | exec bash
}

package() {
  cd "$srcdir"/bds_home
  install -Dm0755 bds "${pkgdir}/usr/bin/bds"
  install -d "${pkgdir}/usr/local/bds"
  for file in $(find include -type f -name *.bds); do
      install -m 644 -D ${file} ${pkgdir}/usr/local/bds/${file#include}
  done
}

# vim:set ts=2 sw=2 et:
