# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="sankeymatic-web-git"
pkgver=r120.ef55750
pkgrel=1
pkgdesc="A Sankey diagram builder for everyone"
url="https://sankeymatic.com"
license=("ISC")
arch=("any")
makedepends=("git")
# see https://github.com/nowthis/sankeymatic/issues/44
source=("git+https://github.com/nowthis/sankeymatic"
        "https://sankeymatic.com/build/canvg/lib/umd.js"
        "https://sankeymatic.com/build/d3.v2.js"
        "https://sankeymatic.com/favicon.ico"
        "https://sankeymatic.com/i/SKM-trsp-300.png"
        )
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP")
options=("!strip")

pkgver(){
 cd "sankeymatic"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
 # replace non existing links pointing to root
 cd "sankeymatic"
 sed -i "build/index.html" \
     -e 's|href="/|href="https://sankeymatic.com/|g' \
     -e 's|href="\.\./about/"|href="https://sankeymatic.com/about/"|g' \
     -e 's|href="\.\./manual/"|href="https://sankeymatic.com/manual/"|g' \
     -e 's|\.\./||g'
}

package(){
 cd "sankeymatic"
 install -d "$pkgdir/usr/share/webapps/sankeymatic"
 install -D -m 644 "LICENSE.txt" "$pkgdir/usr/share/license/sankeymatic/LICENSE"
 rm "LICENSE.txt"
 install -D -m 644 "$srcdir/umd.js" "$pkgdir/usr/share/webapps/sankeymatic/canvg/lib/umd.js"
 install -D -m 644 "$srcdir/d3.v2.js" "$pkgdir/usr/share/webapps/sankeymatic/d3.v2.js"
 install -D -m 644 "$srcdir/favicon.ico" "$pkgdir/usr/share/webapps/sankeymatic/favicon.ico"
 install -D -m 644 "$srcdir/SKM-trsp-300.png" "$pkgdir/usr/share/webapps/sankeymatic/i/SKM-trsp-300.png"
 find . -type f -not -path "./.git/*" -exec cp {} "$pkgdir/usr/share/webapps/sankeymatic" \;
}

