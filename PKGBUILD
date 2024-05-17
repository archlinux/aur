# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
pkgver=2024.5.0
pkgrel=1
pkgdesc="Download web video and audio"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
depends=('bash' 'dotnet-runtime' 'ffmpeg' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'python-psutil' 'yt-dlp')
makedepends=('blueprint-compiler' 'dotnet-sdk' 'git' 'libadwaita')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("git+${url}#tag=${pkgver}"
        "git+https://github.com/NickvisionApps/CakeScripts")
sha256sums=('b5a674b4769ca5e2bcb215d409a12869329bd2a5897c33d5aa451c5e62b1c19a'
            'SKIP')

prepare() {
    cd "${pkgname^}"
    git submodule init
    git config submodule.CakeScripts.url "${srcdir}/CakeScripts"
    git -c protocol.file.allow=always submodule update
    dotnet tool restore
}

build() {
    cd "${pkgname^}"
    dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
    cd "${pkgname^}"
    dotnet cake --target=Install --destdir="${pkgdir}"
    ln -s org.nickvision.tubeconverter "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
