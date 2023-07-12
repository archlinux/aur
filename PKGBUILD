# Maintainer: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
# Contributor: detiam <dehe_tian at outlook dot com>

# shellcheck disable=SC1090
# shellcheck disable=SC2206
pkgname=pince-git
pkgver=r1304.e31ea7c
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('base-devel') # follow upstream, set this later
makedepends=('git' 'intltool')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')
_installpath='usr/share/PINCE'

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Remove ".venv/PINCE" exist check
  sed -i '/^if \[ ! -d "\.venv\/PINCE" \]; /,/activate$/ s/^/# /' "./$pkgname/PINCE.sh"
  # Create a simple start script
  cat >pince<< \
EOF
pushd /$_installpath
sh PINCE.sh "$@"
popd
EOF
}

build() {
  cd "$pkgname"
  # Source libscanmem installation functions
  . <(sed -n '/^compile_scanmem() /,/^}/p' install_pince.sh)
  . <(sed -n '/^install_scanmem() /,/^}/p' install_pince.sh)
  . <(sed -n '/^exit_on_error() /,/^}/p' install_pince.sh)
  # Run functions
  install_scanmem || exit_on_error
}

package() {
  cd "$pkgname"
  # Source PKG_NAMES* vars
  . <(sed -n '/^PKG_NAMES/p' install_pince.sh)
  # Set new depends
  depends+=($PKG_NAMES_ARCH)
  for pipkg in $PKG_NAMES_PIP; do
    ## why archlinux python package isn't just match "python-$pipkg" format?
    if [ "$pipkg" == "distorm3" ]; then
      depends+=("python-distorm")
    elif [ "$pipkg" == "pygobject" ]; then
      depends+=("python-gobject")
    elif [ "$pipkg" == "keystone-engine" ]; then
      depends+=("python-keystone")
    else
      depends+=("python-$pipkg")
    fi
  done
  # Copy files
  install -d "$pkgdir/usr/bin"
  install -Dm755 ../pince "$pkgdir/usr/bin"
  install -d "$pkgdir/$_installpath"
  install PINCE.sh PINCE.py \
    COPYING COPYING.CC-BY AUTHORS THANKS "$pkgdir/$_installpath"
  cp -r GUI libpince media tr i18n "$pkgdir/$_installpath"
}
