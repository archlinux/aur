# Maintainer: Kiernan Preve <kiernanpreve@gmail.com>

_pkgname=8188gu
pkgname="$_pkgname-kelebek333-dkms-git"
pkgver=r14.57c5d68
pkgrel=1
pkgdesc='Kernel driver module for Realtek RTL8188gu (device id 0bda:1a2b)'
arch=('any')
url="https://github.com/KierPrev/rtl8188gu"
license=('GPL3')
depends=('dkms')
conflicts=('8188gu-dkms-git')
makedepends=('git')
install="${_pkgname}-dkms.install"
source=("$_pkgname::git+https://github.com/KierPrev/rtl8188gu.git"
        blacklist-r8188gu.conf
        dkms.conf)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')



pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  local i;for i in "${source[@]}";do
    case $i in
      *.patch)
        echo "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
    esac
  done
  # Disable power saving (possibly already done below?)
  sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile
}

package() {
  cd "$srcdir"

  local install_dir="$pkgdir/usr/src/$_pkgname-$pkgver"

  # Copy dkms.conf
  install -Dm644 dkms.conf "$install_dir/dkms.conf"

  # Blacklist r8188gu
  install -Dm644 blacklist-r8188gu.conf "$pkgdir/etc/modprobe.d/r8188gu.conf"

  # Set name and version
  sed -e "s/@_PKGNAME@/$_pkgname/" -e "s/@PKGVER@/$pkgver/" -i "$install_dir/dkms.conf"

  # Copy sources
  cd "$_pkgname"

  for d in $(find . -type d); do
    install -dm755 "$install_dir/$d"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "$f" "$install_dir/$f"
  done

  mkdir -p "$pkgdir/etc/modprobe.d/"
  echo "options rtl8188gu rtw_power_mgnt=0 rtw_enusbss=0" > "$pkgdir/etc/modprobe.d/rtl8188gu.conf"
}
