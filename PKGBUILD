# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Arpan Kapoor <a at arpankapoor dot com> for 8188eu-dkms
# Contributor: Runnytu < runnytu at gmail dot com > for 8192cu-dkms

_pkgname=8188fu
pkgname="$_pkgname-kelebek333-dkms-git"
pkgver=r115.751882b
pkgrel=1
pkgdesc='Kernel driver module for Realtek RTL8188FU and RTL8188FTV Wireless 802.11n USB 2.0 adapters (device id 0bda:f179), for kernel versions < 6'
arch=('any')
url="https://github.com/kelebek333/rtl8188fu"
license=('GPL3')
depends=('dkms')
conflicts=('8188fu-dkms-git')
makedepends=('git')
install="${_pkgname}-dkms.install"
source=("$_pkgname::git+https://github.com/kelebek333/rtl8188fu.git"
        blacklist-r8188fu.conf
        dkms.conf)
sha256sums=('SKIP'
            '48bc8d2270ea8db1e5c0be51012419753b22a106028e153919b37d583c422cc6'
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

  # Blacklist r8188fu
  install -Dm644 blacklist-r8188fu.conf "$pkgdir/etc/modprobe.d/r8188fu.conf"

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
