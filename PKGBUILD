# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Arpan Kapoor <a at arpankapoor dot com> for 8188eu-dkms
# Contributor: Runnytu < runnytu at gmail dot com > for 8192cu-dkms

_pkgname=8188fu
pkgname="$_pkgname-dkms-git"
pkgver=r13.586d795
pkgrel=1
pkgdesc='Kernel driver module for Realtek RTL8188FU and RTL8188FTV Wireless 802.11n USB 2.0 adapters (device id 0bda:f179), for kernel versions less than 5.8'
arch=('any')
url="https://github.com/corneal64/Realtek-USB-Wireless-Adapter-Drivers"
license=('GPL3')
conflicts=('8188fu-kelebek333-dkms-git')
depends=('dkms')
makedepends=('git')
install="${_pkgname}-dkms.install"
source=("$_pkgname::git+https://github.com/corneal64/Realtek-USB-Wireless-Adapter-Drivers.git"
        blacklist-r8188fu.conf
        dkms.conf
        'https://raw.githubusercontent.com/kelebek333/rtl8188fu/4b1ca2e734467a0af1e481cd9d56edb0475ec68a/firmware/rtl8188fufw.bin')
sha256sums=('SKIP'
            '48bc8d2270ea8db1e5c0be51012419753b22a106028e153919b37d583c422cc6'
            'e2b146ffbe6b81c6a8c963ee2826aecc3a092497fd9b33c6290751da5706d103'
            'e6189d6d7032b83f0ed4284629c43db66262449a866f33fd329e611239f62e1f')



pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname/rtl$_pkgname"
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

  # Blacklist r8188fu
  install -Dm644 blacklist-r8188fu.conf "$pkgdir/etc/modprobe.d/r8188fu.conf"

  # Set name and version
  sed -e "s/@_PKGNAME@/$_pkgname/" -e "s/@PKGVER@/$pkgver/" -i "$install_dir/dkms.conf"

  # Install firmware
  install -Dm644 rtl8188fufw.bin ${pkgdir}/usr/lib/firmware/rtlwifi/rtl8188fufw.bin

  # Copy sources
  cd "$_pkgname/rtl$_pkgname"

  for d in $(find . -type d); do
    install -dm755 "$install_dir/$d"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "$f" "$install_dir/$f"
  done

  mkdir -p "$pkgdir/etc/modprobe.d/"
  echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" > "$pkgdir/etc/modprobe.d/rtl8188fu.conf"
}
