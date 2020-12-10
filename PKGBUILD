# Maintainer: Felipe Balbi <felipe.balbi@microsoft.com>
pkgname=azure-sphere-sdk
pkgmajor=20
pkgminor=11
pkgver=${pkgmajor}.${pkgminor}
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
source=("${pkgname}-${pkgver}.tar.gz::https://software-download.microsoft.com/download/pr/Azure_Sphere_SDK_Bundle_${pkgmajor}_${pkgminor}.tar.gz"
        "azure-sphere-sdk.udev"
        "azure-sphere-sdk.sysusers")
sha256sums=('7d6fb0b77761be795eaeb78b4a7ecd69f08eab54c5a73a7a41478bd983dabbd2'
            '649ec04bdd0c052838bf3364fdd32313264891c4f7f60039cb644ef79c3c589f'
            '323c5e51b6bcf92c7e024cfd6bd6843cb57531317c6ef887b1bced81e920d43e')

prepare() {
  tar -zxf "Azure_Sphere_SDK.tar.gz"
}

build() {
  find "${srcdir}" -type d -exec chmod 755 {} \;
  find "${srcdir}" -type f -exec chmod 644 {} \;
  chmod 755 "${srcdir}"/azurespheresdk/Tools/azsphere
  chmod 755 "${srcdir}"/azurespheresdk/DeviceConnection/azsphere_slattach
  chmod 755 "${srcdir}"/azurespheresdk/DeviceConnection/azsphere_connect.sh

  for sysroot in `ls ${srcdir}/azurespheresdk/Sysroots/`; do
    chmod 755 "${srcdir}"/azurespheresdk/Sysroots/"${sysroot}"/tools/exp23-appsdk-linux-blanca.sh
  done
}

package() {
  install -Dm644 "${srcdir}"/azurespheresdk/LICENSE_en-US.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_en-US
  install -Dm644 "${srcdir}"/azurespheresdk/LICENSE_fr-FR.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_fr-FR
  install -Dm644 "${srcdir}"/"${pkgname}".udev "${pkgdir}"/etc/udev/rules.d/75-mt3620.rules
  install -Dm644 "${srcdir}"/"${pkgname}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf

  mkdir -p "${pkgdir}"/opt/azurespheresdk

  for DIR in BoardConfigPresets CMakeFiles DebugTools DeviceConnection HardwareDefinitions Sysroots \
             Tools Tools_v2_Installer; do
    cp -r "${srcdir}"/azurespheresdk/"${DIR}" "${pkgdir}"/opt/azurespheresdk
  done

  mkdir -p "${pkgdir}"/usr/bin
  ln -s ../../opt/azurespheresdk/Tools/azsphere "${pkgdir}"/usr/bin/azsphere
  ln -s ../../opt/azurespheresdk/DeviceConnection/azsphere_connect.sh "${pkgdir}"/usr/bin/azsphere_connect.sh
  ln -s ../../opt/azurespheresdk/DeviceConnection/azsphere_slattach "${pkgdir}"/usr/bin/azsphere_slattach
}

