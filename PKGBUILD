# Maintainer Ruijie Yu (first.last@outlook.com)

pkgname=appveyor-server
pkgver=7.0.2915
pkgrel=1
pkgdesc='Appveyor Server for Linux'
url='https://www.appveyor.com/self-hosted/'
arch=(x86_64)
license=(custom)
backup=(
    etc/sudoers.d/appveyor-server-sudoers
)

depends=(
    'dotnet-runtime'
    'libcap'
)
makedepends=()
source=(
    'https://www.appveyor.com/downloads/appveyor/appveyor-server.deb'
    'appveyor-check-version.sh'
    'ver.pgrep'
)
sha512sums=('695f1a60b012df6327ebc1a86d94da155ec5e9a0970ddd3040d0ed0bade1dce33d3b1ec490504b6e562266165e903987314f826bdb8642caaee0bb470893aaf2'
            'aef44a8ca47cc60df8ca75cbd8deeada2d52d4ceb282f204c31ff97cadcb3754761f3c173363d516e41ac90035cf7ba50c4708f232802fea26444820cd00f768'
            'a0c55edb4d482876566db8a3178b3d7a318acae4185dbe28cae83482ae45e122495a99109a7ddf44b499cfd51f5c63dbfe15f480aa28add27af9f893375cc974')
noextract=(
    "${source[0]##*/}" # basename
)

pkgver() {
    bash "${srcdir}/${source[1]}" out
}

package() {
    bsdtar -O -xf "${srcdir}/${noextract[0]}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # move license
    LICENSE_DIR="usr/share/licenses/${pkgname}"
    ORIG_LICENSE="usr/share/doc/appveyor-server/copyright" 
    install -dm0755 "${pkgdir}/${LICENSE_DIR}"
    mv "${pkgdir}/${ORIG_LICENSE}" "${pkgdir}/${LICENSE_DIR}/LICENSE"
    ln -s "/${LICENSE_DIR}/LICENSE" "${pkgdir}/${ORIG_LICENSE}"
}

