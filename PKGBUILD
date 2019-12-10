# Maintainer: Dennis Oehme <oehme@gardenofconcepts.com>

pkgname=teams-for-linux-official-bin
pkgver=1.2.00.32451
pkgrel=1
pkgdesc='Microsoft Teams is cloud-based team collaboration software that is part of the Office 365 suite of applications. The core capabilities in Microsoft Teams include business messaging, calling, video meetings and file sharing.'
arch=('x86_64')
_arch='amd64'
license=('custom')
url='https://teams.microsoft.com/downloads'
depends=(
'alsa-lib>=1.0.16', # libasound2 (>= 1.0.16)
'at-spi2-atk>=2.5.3', # libatk-bridge2.0-0 (>= 2.5.3)
# libatk>=12.4', # libatk1.0-0 (>= 1.12.4)
'glibc>=2.17', # libc6 (>= 2.17)
'cairo>=1.6.0', # libcairo2 (>= 1.6.0)
'cups>=1.4.0', # libcups2 (>= 1.4.0)
'expat>=2.0.1', # libexpat1 (>= 2.0.1)
# libgcc>=1:3.0', # libgcc1 (>= 1:3.0)
'gdk-pixbuf2>=2.22.0', # libgdk-pixbuf2.0-0 (>= 2.22.0)
'glib2>=2.35.8', # libglib2.0-0 (>= 2.35.8)
'gtk3>=3.9.10', # libgtk-3-0 (>= 3.9.10)
'nspr>=4.9', # libnspr4 (>= 2:4.9-2~)
'nss>=3.22', # libnss3 (>= 2:3.22)
'pango>=1.4.0', # libpango-1.0-0 (>= 1.14.0)
# libpangocairo-1.0-0 (>= 1.14.0)
'libsecret>=0.7', # libsecret-1-0 (>= 0.7)
'libutil-linux>=2.16' # libuuid1 (>= 2.16)
'libx11>=1.4.99', # libx11-6 (>= 2:1.4.99.1)
# libx11-xcb1
'libxcb>=1.6', # libxcb1 (>= 1.6)
'libxcomposite>=0.3', # libxcomposite1 (>= 1:0.3-1)
'libxcursor>=1.1.2', # libxcursor1 (>> 1.1.2)
'libxdamage>=1.1', # libxdamage1 (>= 1:1.1)
'libxext>=0', # libxext6
'libxfixes>=0', # libxfixes3
'libxi>=1.2.99', # libxi6 (>= 2:1.2.99.4)
'libxkbfile>=0', # libxkbfile1
'libxrandr>=1.2.99', # libxrandr2 (>= 2:1.2.99.3)
'libxrender>=0', # libxrender1
'libxss>=0', # libxss1
'libxtst>=0', # libxtst6
# apt-transport-https
'fontconfig>=2.11.0', # libfontconfig1 (>= 2.11.0)
'dbus>=1.6.18', # libdbus-1-3 (>= 1.6.18)
'gcc-libs>=4.8.1', # libstdc++6 (>= 4.8.1)
)

source=('LICENSE'
        "${pkgname}-${pkgver}-Release::https://packages.microsoft.com/repos/ms-teams/dists/stable/Release"
        "${pkgname}-${pkgver}-Release.sig::https://packages.microsoft.com/repos/ms-teams/dists/stable/Release.gpg")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_${pkgver}_${_arch}.deb"
               "${pkgname}-${pkgver}-x86_64-Packages::https://packages.microsoft.com/repos/ms-teams/dists/stable/main/binary-${_arch}/Packages")
sha512sums=('cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            '36bf8dc232f1c40a58d475d07bd7b9078f41e24e5c8a538d29784af8bc155047d78ecd939962f3326f422b246c8a907a0fdcdaf31a74f231166802477c87e2fc'
            'SKIP')
sha512sums_x86_64=('2e921c0ebd2306b6f61f5ecd448206922394a19339e8c14023aa1778444a649bf4730c71362263e53bb833caed05907203d782221429e853d76695695835e407'
                   'ec956a9abdd35e3d9b116cd2b30cae99286203e5496a4d0646ccb5f9d16a6b2239ca88586895421b31aaf9dd2e0c9928966db44066dcd7b1a7f1047fcc5e6d0f')

# wget https://packages.microsoft.com/keys/microsoft.asc
# gpg --import microsoft.asc
validpgpkeys=('EB3E94ADBE1229CF', 'BC528686B50D79E339D3721CEB3E94ADBE1229CF') # Microsoft (Release signing) <gpgsecurity@microsoft.com>

prepare() {
    # Validate hashes from the PGP signed "Release" file
    echo "$(grep main/binary-amd64/Packages ${pkgname}-${pkgver}-Release | grep -E "\W[a-z0-9]{64}\W" | head -n 1 | awk '{print $1}') ${pkgname}-${pkgver}-${CARCH}-Packages" \
        > "${pkgname}-${pkgver}-${CARCH}-Packages.sha256"
    
    sha256sum -c "${pkgname}-${pkgver}-${CARCH}-Packages.sha256"

    echo "$(grep SHA512 ${pkgname}-${pkgver}-${CARCH}-Packages | head -n 1 | awk '{print $2}') ${pkgname}-${pkgver}-${CARCH}.deb" \
        > "${pkgname}-${pkgver}-${CARCH}.deb.sha512"
    sha512sum -c "${pkgname}-${pkgver}-${CARCH}.deb.sha512"
}

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -Dm 644 "${pkgdir}/usr/share/teams/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
