_pkgname="xradio"
pkgname="${_pkgname}-sl-git"
pkgbase=${_pkgname}
pkgver=r183.354e8c3
pkgrel=1
pkgdesc="Driver for the Allwinner XRadio XR819 wifi chip"
arch=(armv7h)
url="https://github.com/karabek/xradio.git"
license=('GPL')
depends=()
install=xradio.install
makedepends=('git' 'linux-headers')
conflicts=("${pkgbase}-git")
provides=("${pkgbase}-git")
source=("${_pkgname}::git+https://github.com/karabek/xradio.git")
sha256sums=('SKIP')
_KVER=5.8.9-1-ARCH

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "xradio"
   sed -i "s|.*CONFIG_WLAN_VENDOR_XRADIO := m.*| CONFIG_WLAN_VENDOR_XRADIO := m|g" Makefile
   sed -i "s|.*DCONFIG_XRADIO_USE_EXTENSIONS.*| ccflags-y += -DCONFIG_XRADIO_USE_EXTENSIONS|g" Makefile

   make -C /usr/lib/modules/${_KVER}/build M=$PWD modules
}

package() {
   cd "xradio"
   make -C /usr/lib/modules/${_KVER}/build M=$PWD INSTALL_MOD_PATH="${pkgdir}" modules_install

   # fix modules path
   mkdir -p "${pkgdir}"/usr
   mv "${pkgdir}"/lib "${pkgdir}"/usr/

   # install firmware
   for i in boot fw sdd; do
      install -Dm0644 "${srcdir}"/xradio/firmware/${i}_xr819.bin "${pkgdir}"/usr/lib/firmware/xr819/${i}_xr819.bin
   done
   install -Dpm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
   install -Dpm644 README* -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
