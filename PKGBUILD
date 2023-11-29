# Maintainer:
# Contributor: QiE2035 <qie2035@qq.com>

# options
: ${_pkgtype:=non-opt}

# basic info
_pkgname=logseq-desktop
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=0.10.0
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL3')
arch=("x86_64")

depends=('electron')
makedepends=('asar')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="Logseq-linux-x64"
source=(
    "$url/releases/download/$pkgver/$_pkgsrc-$pkgver.zip"
)
sha256sums=(
    'ca7ac5022e3317444562e027566b5afb0641db9421ce199ca8964b07f2512b37'
)

prepare() {
    cat <<'EOF' > "$_pkgname.sh"
#!/bin/sh
exec electron /usr/lib/logseq-desktop/app.asar
EOF

    gendesk -q -f -n --categories "Office" --pkgname="${_pkgname}" --pkgdesc="$pkgdesc" --name="Logseq" --exec="${_pkgname}"
}

package() {
    # desktop file
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/logseq-desktop.desktop"

    # icons
    install -Dm644 "$_pkgsrc/resources/app/icons/logseq.png" \
        -t "$pkgdir/usr/share/pixmaps/"

    # asar
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    asar pack "$_pkgsrc/resources/app" "$pkgdir/usr/lib/$_pkgname/app.asar"

    # script
    install -Dm755 "logseq-desktop.sh" "$pkgdir/usr/bin/logseq"
}
