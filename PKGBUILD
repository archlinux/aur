# Maintainer: Snd <snd.scrape (at) gmail dot com>
pkgname=komelia
pkgver=0.16.0
pkgrel=1
pkgdesc="Komga media client"
arch=('x86_64')
url="https://github.com/Snd-R/Komelia"
license=('Apache-2.0')
depends=('java-runtime>=17' 'libvips' 'org.freedesktop.secrets')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'npm' 'gradle' 'webkit2gtk-4.1')
optdepends=(
	'webkit2gtk-4.1: epub reader support'
)
source=(
	'git+https://github.com/Snd-R/Komelia.git#commit=66e62c8e5fa2722315fecfb9e58e2a517daf2320'
	'git+https://github.com/Snd-R/ChipTextField.git#commit=a06f5f356cd0daa698404808100eade87d2614d8'
	'git+https://github.com/Snd-R/compose-sonner.git#commit=5d43b3f958c881aae10708b7de54399bd7661d8a'
	'git+https://github.com/Snd-R/secret-service.git#commit=efca0226a444fc7ca4be06858a457c50f63cd7b8'
	'git+https://github.com/Snd-R/hkdf.git#commit=1d42fc2def0fcc7c04b7617678ee943d65e62197'
	
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
    git -C Komelia submodule init

    git -C Komelia config --local submodule.third_party/secret-service.url "${srcdir}/secret-service"
    git -C Komelia config --local submodule.third_party/compose-sonner.url "${srcdir}/compose-sonner"
    git -C Komelia config --local submodule.third_party/ChipTextField.url "${srcdir}/ChipTextField"
    git -C Komelia -c protocol.file.allow='always' submodule update

    git -C Komelia/third_party/secret-service submodule init
    git -C Komelia/third_party/secret-service config --local submodule.hkdf.url "${srcdir}/hkdf"
    git -C Komelia/third_party/secret-service -c protocol.file.allow='always' submodule update
}

build() {
    gradle -p "${srcdir}/Komelia" komeliaBuildNonJvmDependencies
    gradle -p "${srcdir}/Komelia" :komelia-app:repackageUberJar
}

package() {
	install -Dm755 "${srcdir}/Komelia/komelia-app/build/compose/jars/Komelia-linux-x64-${pkgver}-release.jar" "${pkgdir}/opt/komelia/komelia.jar"
	install -Dm644 "${srcdir}/Komelia/icons/ic_launcher.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/komelia.png"
	install -Dm755 "../komelia" -t "${pkgdir}/usr/bin"
	install -Dm644 "../komelia.desktop" "${pkgdir}/usr/share/applications/komelia.desktop"
}
