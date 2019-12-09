# Maintainer: Felipe Balbi <felipe.balbi@microsoft.com>
pkgname=azure-sphere-sdk 
pkgver=19.09Beta
pkgrel=1
pkgdesc="Azure Sphere SDK Preview for Linux"
arch=('x86_64')
url="https://aka.ms/AzureSphereSDK"
license=('custom')
depends=('cmake'
	 'curl'
	 'flex'
	 'libmpc'
	 'net-tools'
	 'ninja')
install="${pkgname}".install
optdepends=('minicom: for serial communication with the Sphere board'
	    'code: for software development')
options=(!strip staticlibs)
source=("${pkgname}-${pkgver}.tar.gz::https://software-download.microsoft.com/download/pr/Azure_Sphere_SDK_Preview_Bundle.tar.gz"
	"azure-sphere-sdk.udev"
        "azure-sphere-sdk.sysusers")
sha256sums=('6518bb29ef7d6c40701ef1420bbd3dcf068236939f0e8e11c30769857dd34837'
            '649ec04bdd0c052838bf3364fdd32313264891c4f7f60039cb644ef79c3c589f'
	    '323c5e51b6bcf92c7e024cfd6bd6843cb57531317c6ef887b1bced81e920d43e')

prepare() {
  tar -zxf "Azure_Sphere_SDK_Preview.tar.gz"
}

build() {
  find "${srcdir}" -type d -exec chmod 755 {} \;
  find "${srcdir}" -type f -exec chmod 644 {} \;
  chmod 755 "${srcdir}"/azurespheresdk/Tools/azsphere
  chmod 755 "${srcdir}"/azurespheresdk/Tools/azsphere_slattach
  chmod 755 "${srcdir}"/azurespheresdk/Tools/azsphere_connect.sh

  for sysroot in 3 3+Beta1909; do
    chmod 755 "${srcdir}"/azurespheresdk/Sysroots/"${sysroot}"/tools/exp23-appsdk-linux-blanca.sh
    "${srcdir}"/azurespheresdk/Sysroots/"${sysroot}"/tools/exp23-appsdk-linux-blanca.sh -d "${srcdir}"/azurespheresdk/Sysroots/"${sysroot}"/tools/ -y
  done
}

package() {
  install -Dm644 "${srcdir}"/azurespheresdk/LICENSE.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 "${srcdir}"/"${pkgname}".udev "${pkgdir}"/etc/udev/rules.d/75-mt3620.rules
  install -Dm644 "${srcdir}"/"${pkgname}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf

  mkdir -p "${pkgdir}"/opt/azurespheresdk
  for DIR in BoardConfigPresets CMakeFiles Tools DebugTools Sysroots; do
    cp -r "${srcdir}"/azurespheresdk/"${DIR}" "${pkgdir}"/opt/azurespheresdk
  done

  mkdir -p "${pkgdir}"/usr/bin
  for i in azsphere azsphere_connect.sh azsphere_slattach; do
    ln -s ../../opt/azurespheresdk/Tools/"$i" "${pkgdir}"/usr/bin/"$i"
  done
}

