# Maintainer: rintim <rintim@foxmail.com>

pkgname=sdkman-bin
pkgver=5.20.0
_nativepkgver=0.7.14
pkgrel=3
pkgdesc="The Software Development Kit Manager Command Line Interface"
arch=('x86_64' 'aarch64')
url="https://sdkman.io/"
license=('Apache-2.0')

depends=("curl")
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")

_githuburl="https://github.com/sdkman/sdkman-cli/"
_githubnativeurl="https://github.com/sdkman/sdkman-cli-native/"

source_x86_64=("${pkgname%-bin}-$pkgver.zip::$_githuburl/releases/download/$pkgver/sdkman-cli-$pkgver.zip"
               "${pkgname%-bin}-native-$_nativepkgver.zip::$_githubnativeurl/releases/download/v$_nativepkgver/sdkman-cli-native-$_nativepkgver-$CARCH-unknown-linux-gnu.zip")
source_aarch64=("${pkgname%-bin}-$pkgver.zip::$_githuburl/releases/download/$pkgver/sdkman-cli-$pkgver.zip"
                "${pkgname%-bin}-native-$_nativepkgver.zip::$_githubnativeurl/releases/download/v$_nativepkgver/sdkman-cli-native-$_nativepkgver-$CARCH-unknown-linux-gnu.zip")

_zipdir="sdkman-$pkgver"
_zipnativedir="sdkman-cli-native-$_nativepkgver-$CARCH-unknown-linux-gnu"
_sdkmandir="/usr/lib/${pkgname%-bin}/libexec"

package() {
    mkdir -p "$pkgdir/$_sdkmandir"
    mkdir -p "$pkgdir/$_sdkmandir/tmp"
    mkdir -p "$pkgdir/$_sdkmandir/ext"
    mkdir -p "$pkgdir/$_sdkmandir/etc"
    mkdir -p "$pkgdir/$_sdkmandir/var"
    mkdir -p "$pkgdir/$_sdkmandir/candidates"
    mkdir -p "$pkgdir/$_sdkmandir/libexec"

    curl -s "https://api.sdkman.io/2/candidates/all" -o "$pkgdir/$_sdkmandir/var/candidates"

    install -Dm755 "${srcdir}/$_zipdir/bin/sdkman-init.sh" -t "$pkgdir/$_sdkmandir/bin"
    install -Dm644 "${srcdir}/$_zipdir/contrib/completion/bash/sdk" -t "$pkgdir/$_sdkmandir/contrib/completion/bash"
    install -Dm755 "${srcdir}/$_zipdir/src"/* -t "$pkgdir/$_sdkmandir/src"

    touch "$pkgdir/$_sdkmandir/etc/config"

    echo "sdkman_auto_answer=false" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_auto_complete=true" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_auto_env=false" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_beta_channel=false" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_colour_enable=true" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_curl_connect_timeout=7" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_curl_max_time=10" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_debug_mode=false" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_insecure_ssl=false" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_rosetta2_compatible=false" >> "$pkgdir/$_sdkmandir/etc/config"
    echo "sdkman_selfupdate_feature=false" >> "$pkgdir/$_sdkmandir/etc/config"

    echo "$pkgver" > "$pkgdir/$_sdkmandir/var/version"
    echo "$_nativepkgver" > "$pkgdir/$_sdkmandir/var/version_native"

    if [ $CARCH = "x86_64" ]; then
        echo "linuxx64" >> "$pkgdir/$_sdkmandir/var/platform"
    elif [ $CARCH = "aarch64" ]; then
        echo "linuxarm64" >> "$pkgdir/$_sdkmandir/var/platform"
    fi

    install -Dm755 "${srcdir}/$_zipnativedir/libexec"/* -t "$pkgdir/$_sdkmandir/libexec"
}

sha256sums_x86_64=('09c57ad7b6de2fff2b2153d62ee44fbf4ac189257291ba12a173422717adc22a'
                   'bc28c358f58a22ef90cb1f92617b2319c0ead900851b700dbd65461212756cc9')
sha256sums_aarch64=('09c57ad7b6de2fff2b2153d62ee44fbf4ac189257291ba12a173422717adc22a'
                    'a591602241a4a5c4385a5cdf4205b6408b587b0015ed7c7178d31870bd612642')
