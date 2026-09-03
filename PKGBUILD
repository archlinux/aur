# Maintainer: Snd <snd.scrape (at) gmail dot com>
pkgname=komelia
pkgver=0.19.0
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
	'git+https://github.com/Snd-R/Komelia.git#commit=65f92fde60b7b7b62b85a55ceb80b92adf50eec8'
	'git+https://github.com/Snd-R/ChipTextField.git#commit=7c575c550c83e95fb2c9eb44ffa35264becd8739'
	'git+https://github.com/Snd-R/compose-sonner.git#commit=92c5c82d175a106f9779c8fad886679bf430d484'
	'git+https://github.com/Snd-R/secret-service.git#commit=907b46e55a9bd4f5c7df795a17f1e09f2fee70cb'
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
    git -C Komelia -c protocol.file.allow='always' submodule update ./third_party/secret-service
    git -C Komelia -c protocol.file.allow='always' submodule update ./third_party/compose-sonner
    git -C Komelia -c protocol.file.allow='always' submodule update ./third_party/ChipTextField
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
    ./gradlew :komelia-app:desktopApp:packageReleaseUberJarForCurrentOS
}

package() {
	install -Dm755 "${srcdir}/Komelia/komelia-app/desktopApp/build/compose/jars/Komelia-linux-x64-${pkgver}-release.jar" "${pkgdir}/opt/komelia/komelia.jar"
	install -Dm644 "${srcdir}/Komelia/fastlane/metadata/android/en-US/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/komelia.png"
	install -Dm755 "../komelia" -t "${pkgdir}/usr/bin"
	install -Dm644 "../komelia.desktop" "${pkgdir}/usr/share/applications/komelia.desktop"
}
