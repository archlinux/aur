# Maintainer: Snd <snd.scrape (at) gmail dot com>
pkgname=komelia
pkgver=0.18.5
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
	'git+https://github.com/Snd-R/Komelia.git#commit=0e6428ec847f775add0d4e6b46f218ee70e01d78'
	'git+https://github.com/Snd-R/ChipTextField.git#commit=a06f5f356cd0daa698404808100eade87d2614d8'
	'git+https://github.com/Snd-R/compose-sonner.git#commit=486fbd06c42c0c4e930c4642a5d80dd767e3c2d0'
	'git+https://github.com/Snd-R/secret-service.git#commit=cf21890a678f5f5c0da5f488c044903e66b835c7'
)

sha256sums=('SKIP'
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
}

build() {
    # npm >=12 defaults allow-git/allow-remote to "none"; the web UI has a
    # git dependency (R2D2BC), so re-enable them for this build.
    export NPM_CONFIG_ALLOW_GIT=all
    export NPM_CONFIG_ALLOW_REMOTE=all
    # That git dep is an ssh:// URL; rewrite to https so no SSH key is needed
    # (injected via env so we don't touch the user's global git config).
    export GIT_CONFIG_COUNT=1
    export GIT_CONFIG_KEY_0="url.https://github.com/.insteadOf"
    export GIT_CONFIG_VALUE_0="ssh://git@github.com/"

    cd "${srcdir}/Komelia"
    ./gradlew komeliaBuildNonJvmDependencies
    ./gradlew :komelia-app:packageReleaseUberJarForCurrentOS
}

package() {
	install -Dm755 "${srcdir}/Komelia/komelia-app/build/compose/jars/Komelia-linux-x64-${pkgver}-release.jar" "${pkgdir}/opt/komelia/komelia.jar"
	install -Dm644 "${srcdir}/Komelia/fastlane/metadata/android/en-US/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/komelia.png"
	install -Dm755 "../komelia" -t "${pkgdir}/usr/bin"
	install -Dm644 "../komelia.desktop" "${pkgdir}/usr/share/applications/komelia.desktop"
}
