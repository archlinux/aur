# Maintainer: Gergely Imreh <gergely at imreh dot net>
# Contributor: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>

# Testing pages:
# * https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/webtesting/SampleY.aspx
# * /usr/share/nhiicc/html/ESample.html in this package

pkgname=nhiicc
epoch=1
pkgver=20240710.1
pkgrel=5
pkgdesc='台灣健保卡網路註冊憑證元件 (National Health Insurance IC Card)'
arch=('x86_64')
url='https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm'
# Proprietary freeware with no published licence terms (see LICENSE-NHIICC),
# plus the OpenSSL 1.1.1f statically linked into the binary
license=('LicenseRef-NHIICC AND OpenSSL')
# bash, sed and openssl are for regen-certs.sh and nhiicc.install; the binary has
# OpenSSL 1.1 built in
depends=('glibc' 'pcsclite' 'bash' 'sed' 'openssl')
makedepends=('patchelf')
# Prebuilt binary: leave it as shipped and don't split out an empty debug package
options=(!debug !strip)
source=("CMS_mNHIICC_Setup-${pkgver}.Linux.zip::https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/CMS_mNHIICC_Setup.Linux.zip"
        "nhiicc.service"
        "hosts"
        "nhiicc.rules"
        "regen-certs.sh"
        "LICENSE-NHIICC"
        "OPENSSL-LICENSE::https://raw.githubusercontent.com/openssl/openssl/OpenSSL_1_1_1f/LICENSE")
noextract=("CMS_mNHIICC_Setup-${pkgver}.Linux.zip")
# The zip's MD5 is published on https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/Eventesting.aspx
md5sums=('3bbad14d8ce82a504811319e06c3cdac'
         '887fa3deba843a992f2551a93833baaa'
         '1631a0754212a002c6d0e79dfaa48592'
         'e4a249ff4e638527a0bde9deec6eeb5a'
         '97e402f39fffe35e411419d062f6baf8'
         '5d373515b2479352b4155a9c61e4d252'
         'd343e62fc9c833710bbbed25f27364c8')
sha256sums=('fb3473fd1a1a8c65c0972d8a39570abdbbb537cc32cac5c4c51527b1c1fce196'
            '062ece967e4fec05db38bcf1a56cbd39efa0b95b7fc3bf10ae79c43d79c9ded8'
            'ca419c2455b42e31d3b0d033fad9650bd294312ca2a2dfb36ffb9ba076b7a687'
            '9b61d872e67f81d46f43a8ebafa65eb283233d4e1edbf396ecf0ec37567b47aa'
            '317539908f0bbf6b41adf8f963b52aa44288a5a6ce9cb5e7bdd9fc52fa65b1d9'
            'f3cf7e345b86f8db1609bc1db96f744be175cc8d383003d0c6324ca5e16c3396'
            'c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c')
b2sums=('3464fc13d444ad99b948ca5703bc33c30857c470a5a92289292a3b84893b606db769bb2efcb7bb185b87b9dc3e5e98426fdafc45ab2195d3f5764d2fc22d6634'
        '76a0e91dff9c08e9a64cb67acb5341a803685262af9e570b64030601572543909ab332bef79ac96715c694d1d3b253d9b1cb12d742499c2900896c9dda6c830a'
        'c56ff01b6ed480b6cad8c9f8650aeb93581db9335e355253e1a13d7c9de79612b691cb721dd18c8e4b61e0d9dff5ab70ba905f6b82782397dd3b82ba0848bb34'
        '259a15130384efbc458575b0399b6324abe78daa96fead85d988a09a44097cbdeff0743d3593d11e60d966034df59c7986eebc57b6bf30509fb1ccfcdc6116fb'
        '538394cf5e3cc8926debde97ed6022c9a64c80139e4af14f4aa7ab33d85464d45326f5e4ea9b64a0a8c9ac20874883722276e1f7e8935aa1e2f713bdf3c579ea'
        '75e0183671fdef0d5f6967b7d4cfc304c9523513bd36efa4a05db440116d9cae15bc07d7eb8bc7ba7ce3c91e64755a8a9ee61ba7bdfd97d3ed8e5eae32a912c6'
        'b79601ce4c3097e4733735a13dab9da9a347c42f2b037a3f851541a8956aa35c51fb67578611a7da024c9f9660199cd9b9abddf8700fa5d18873efb196cf5ebc')
install=nhiicc.install

prepare() {
  # The zip only wraps a single .tar.xz
  bsdtar -xOf "CMS_mNHIICC_Setup-${pkgver}.Linux.zip" | bsdtar -x

  # Delete insecure RUNPATH pointing into the vendor's build tree
  patchelf --remove-rpath mLNHIICC_Setup/x64/mLNHIICC
}

check() {
  local _bin="mLNHIICC_Setup/x64/mLNHIICC"
  # Running it would bind port 7777, so only make sure the RUNPATH is gone
  # and that the loader resolves every library against the system
  [[ -z "$(patchelf --print-rpath "${_bin}")" ]]
  /usr/lib/ld-linux-x86-64.so.2 --list "${_bin}" > /dev/null
}

package() {
  install -Dm755 mLNHIICC_Setup/x64/mLNHIICC -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/regen-certs.sh" -t "${pkgdir}/usr/share/nhiicc"
  # Mount point for the certificates in nhiicc.service
  install -d "${pkgdir}/usr/share/nhiicc/cert"
  cp -dr --no-preserve=ownership mLNHIICC_Setup/html "${pkgdir}/usr/share/nhiicc/"
  install -Dm644 "${srcdir}/hosts" -t "${pkgdir}/usr/share/nhiicc"
  install -Dm644 "${srcdir}/nhiicc.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/nhiicc.rules" -t "${pkgdir}/usr/share/polkit-1/rules.d"
  install -Dm644 "${srcdir}/LICENSE-NHIICC" "${srcdir}/OPENSSL-LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
