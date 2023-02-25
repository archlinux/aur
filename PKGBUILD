# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Arpan Kapoor <a at arpankapoor dot com> for 8188eu-dkms
# Contributor: Runnytu < runnytu at gmail dot com > for 8192cu-dkms

_pkgname=8188fu
pkgname="$_pkgname-supremegamers-dkms-git"
pkgver=r120.40d4a49
pkgrel=1
pkgdesc='Kernel driver module for Realtek RTL8188FU and RTL8188FTV Wireless 802.11n USB 2.0 adapters (device id 0bda:f179), for kernel versions 6.0 and 6.1'
arch=('any')
url="https://github.com/supremegamers/rtl8188fu"
license=('GPL3')
depends=('dkms')
conflicts=('8188fu-dkms-git' '8188fu-kelebek333-dkms-git')
makedepends=('git')
install="${_pkgname}-dkms.install"
source=("$_pkgname::git+https://github.com/supremegamers/rtl8188fu.git#branch=master"
        blacklist-rtl8xxxu.conf
        dkms.conf)
sha256sums=('SKIP'
            'dc6a9bfc6a796461da2219accc7a6ae755ea13253737630e1538f3d98aa7aff5'
            'b948cdf264b397bc68eb25448c8da1370247da064bbf22230542b136bf0d70cb')



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

  # Blacklist rtl8xxxu
  install -Dm644 blacklist-rtl8xxxu.conf "$pkgdir/etc/modprobe.d/rtl8xxxu.conf"

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

  # Install firmware
  install -Dm644 firmware/rtl8188fufw.bin ${pkgdir}/usr/lib/firmware/rtlwifi/rtl8188fufw.bin

  mkdir -p "$pkgdir/etc/modprobe.d/"
  echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" > "$pkgdir/etc/modprobe.d/rtl8188fu.conf"
}
