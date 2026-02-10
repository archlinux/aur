# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="java-service-wrapper-daemon"
pkgver=3.5.59
pkgrel=1
pkgdesc='Java Service Wrapper sh script for creating daemon instances'
arch=('x86_64' 'aarch64')
url='https://wrapper.tanukisoftware.com'
license=(
  'GPL-2.0'
  'GPL-3.0'
  'LicenseRef-Tanuki-CSLA1.3'
)
depends=('java-service-wrapper')
provides=(
  'java-service-wrapper-daemon' # Arch Linux name
  'service-wrapper' # Debian name
)
source=("https://wrapper.tanukisoftware.com/download/${pkgver}/wrapper_${pkgver}_src.tar.gz")
sha256sums=('3b47e7facdd1208ae2570eac301da748a006b551744f3e8db3825bf4ea5c6e06')


# Excerpt from Debian
# https://sources.debian.org/src/service-wrapper-java/3.5.51-2/debian/build-wrapper-scripts

SRCSH="./wrapper_${pkgver}_src/src/bin/App.sh.in"

mk_daemon_sh() {
	sed -n -e "1,${1}p" "$SRCSH"
	cat <<'EOF'

if [ -z "$WRAPPER_CONF" ]; then
	echo >&2 "WRAPPER_CONF not set; abort"
	exit 1
fi

EOF
	sed -n -e "${2},\$p" "$SRCSH"
}

build() {

  # Also from Debian
  sed -n -e '/^#--/=' "$SRCSH" | {

    read -r L1
    read -r L2

    mk_daemon_sh "$L1" "$L2" > daemon.sh
    chmod +x daemon.sh
  }
}

package() {
  install -Dm755 "$srcdir/daemon.sh" "$pkgdir/usr/bin/java-service-wrapper-daemon"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/wrapper_${pkgver}_src/doc/wrapper-community-license-1.3.txt"
}