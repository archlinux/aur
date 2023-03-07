# Maintainer: Felipe Balbi <felipe.balbi@microsoft.com>
pkgname=azure-sphere-sdk
pkgmajor=22
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
source=("${pkgname}-${pkgver}.tar.gz::https://aka.ms/AzureSphereSDKDownload/Linux"
        "azure-sphere-sdk.udev"
        "azure-sphere-sdk.sysusers")
sha256sums=('47418d96466c91ede13828d8ad2773e5a2a008f880c25d436a058c87ad502e27'
            '649ec04bdd0c052838bf3364fdd32313264891c4f7f60039cb644ef79c3c589f'
            '0afb48362c9684940c02d45136998267cbda7196ce04ab9933687f82165af9d4')

prepare() {
  tar -zxf "Azure_Sphere_SDK.tar.gz"
}

build() {
  find "${srcdir}" -type d -exec chmod 755 {} \;
  find "${srcdir}" -type f -exec chmod 644 {} \;

  mkdir -p "${srcdir}"/azurespheresdk/Tools_v2
  tar -zxf "${srcdir}"/azurespheresdk/Tools_v2_Installer/azsphere-cli-v2.tar.gz -C "${srcdir}"/azurespheresdk/Tools_v2
  cp "${srcdir}"/azurespheresdk/Tools_v2_Installer/azsphere.completion "${srcdir}"/azurespheresdk/Tools_v2/azsphere.completion
  rm -rf "${srcdir}"/azurespheresdk/Tools_v2_Installer

  chmod 755 "${srcdir}"/azurespheresdk/Tools_v2/azsphere
  chmod 755 "${srcdir}"/azurespheresdk/Tools/azsphere
  chmod 755 "${srcdir}"/azurespheresdk/DeviceConnection/azsphere_slattach
  chmod 755 "${srcdir}"/azurespheresdk/DeviceConnection/azsphere_connect.sh

  for sysroot in $(ls "${srcdir}"/azurespheresdk/Sysroots/); do
    chmod 755 "${srcdir}"/azurespheresdk/Sysroots/"${sysroot}"/tools/exp23-appsdk-linux-blanca.sh
  done
}

package() {
  install -Dm644 "${srcdir}"/azurespheresdk/LICENSE_en-US.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_en-US
  install -Dm644 "${srcdir}"/azurespheresdk/LICENSE_fr-FR.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_fr-FR
  install -Dm644 "${srcdir}"/"${pkgname}".udev "${pkgdir}"/etc/udev/rules.d/75-mt3620.rules
  install -Dm644 "${srcdir}"/"${pkgname}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf

  mkdir -p "${pkgdir}"/opt/azurespheresdk

  for DIRPATH in $(ls -d "${srcdir}"/azurespheresdk/*/); do
    cp -r "${DIRPATH}" "${pkgdir}"/opt/azurespheresdk
  done
  echo "${pkgver}" > "${pkgdir}"/opt/azurespheresdk/VERSION

  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/bash-completion/completions
  ln -s ../../../../opt/azurespheresdk/Tools_v2/azsphere.completion \
     "${pkgdir}"/usr/share/bash-completion/completions/azsphere
  ln -s ../../opt/azurespheresdk/Tools/azsphere "${pkgdir}"/usr/bin/azsphere_v1
  ln -s ../../opt/azurespheresdk/Tools_v2/azsphere "${pkgdir}"/usr/bin/azsphere_v2
  ln -s azsphere_v2 "${pkgdir}"/usr/bin/azsphere
  ln -s ../../opt/azurespheresdk/DeviceConnection/azsphere_connect.sh "${pkgdir}"/usr/bin/azsphere_connect.sh
  ln -s ../../opt/azurespheresdk/DeviceConnection/azsphere_slattach "${pkgdir}"/usr/bin/azsphere_slattach
}
