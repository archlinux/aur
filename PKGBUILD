# Maintainer: taotieren <admin@taotieren.com>

pkgname=ofdrw
pkgver=2.3.8
pkgrel=1
pkgdesc="Open Fixed layout Document Reader And Writer Libary(OFD-RW) provider developers to generate ofd document and edit it."
arch=(any)
url="https://github.com/ofdrw/ofdrw"
license=('Apache-2.0')
depends=(
    sh
    java-runtime
)
makedepends=(
    java-runtime
    git
    maven
)
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
# options=()
# install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('070677c99e80bab4405a3afcaddd225d56dc8f0145911c3d25c25967884799fd')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    mvn clean package -DskipTests \
        -Ddependency.go-offline.skip=true \
        -Dnative.image.buildArgs="--verbose --no-fallback"
}

package() {
    cd "${srcdir}/${pkgname}"

    find . -name "*.jar" -path "*/target/*" -print0 | while IFS= read -r -d '' jar_file; do
        local base_name=$(basename "$jar_file" | sed "s/-[0-9].*\.jar/\.jar/")

        echo "Install: $base_name"
        install -Dm644 "$jar_file" "$pkgdir/usr/share/java/$pkgname/$base_name"
    done

    install -Dm0755 /dev/stdin "$pkgdir/etc/profile.d/ofdrw.sh" <<EOF
#!/bin/sh
# OFDRW environment variable
export OFDRW_HOME="/usr/share/java/ofdrw"
export OFDRW_VERSION="${pkgver}"
EOF

    install -dm0775 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -R *.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
