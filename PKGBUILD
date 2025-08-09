# Maintainer: taep96 <mail@taep96.moe>
# Contributor: Neokoni <me@neokoni.ink>

pkgname=libbassmix
pkgver=2.4.12
pkgrel=3
pkgdesc="An extension providing the ability to mix together multiple BASS channels, with resampling and matrix mixing features. Also provides the ability to split a BASS channel into multiple channels."
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib libbass)

source=("$pkgname-$pkgver.zip::https://www.un4seen.com/files/bassmix24-linux.zip")

sha256sums=('ced2c015b0e96873f6495d8aa18a61b6d1e17961fd2d00f162b6f8af6489eb25')

prepare() {
    awk '
        /^Licence[[:space:]]*$/ {
            in_license_section = 1
            skip_next_line = 1
            next
        }

        /^History[[:space:]]*$/ {
            in_license_section = 0
        }

        in_license_section {
            if (skip_next_line) {
                skip_next_line = 0
                next
            }

            license[++n] = $0
        }

        END {
            while (n > 0 && license[n] ~ /^[[:space:]]*$/) {
                n--
            }

            for (i = 1; i <= n; i++) {
                print license[i] > "LICENSE"
            }
        }
    ' "$srcdir"/bassmix.txt
}

package() {
    case "$CARCH" in
        i686)
            install -D -m755 libs/x86/libbassmix.so "$pkgdir/usr/lib/libbassmix.so"
                ;;
        armv6h|armv7h)
            install -D -m755 libs/armhf/libbassmix.so "$pkgdir/usr/lib/libbassmix.so"
                ;;
        aarch64|x86_64)
            install -D -m755 libs/$CARCH/libbassmix.so "$pkgdir/usr/lib/libbassmix.so"
                ;;
    esac

    install -D -m644 bassmix.h "$pkgdir/usr/include/bassmix.h"
    install -D -m644 bassmix.chm "$pkgdir/usr/share/doc/libbass/bassmix.chm"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
