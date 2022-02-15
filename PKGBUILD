# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5
_pkgname=${pkgname#java-}
pkgver=6.6
pkgrel=1

pkgdesc="Conveyal R5 Routing Engine"
url="https://github.com/conveyal/r5"
license=("MIT")

arch=("i686" "x86_64")

depends=("jdk11-openjdk" "java-environment")
makedepends=("gradle" "git")

source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/conveyal/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "01-don-t-try-to-guess-git-version_v6.6.patch"
    "r5-backend.service"
    "r5-backend.sysusers"

)
sha512sums=(
    "866d682a3ac4fd79a9681f7f3db4c7761eb292ffd61ee66d63d3e89ee45607d6ff3bc0d19abfda071fb71140ecf9ebc1440566f4ff39a416c84efa409a17fd56"
    "7d8441625313921e5644e6cd230b708600647ec3accdc7e3bf75463138e4e9b46298103668012adc32bc9e2c59c035b6bb4f53931801a089e74e99d0e39730a1"
    "bbd8b1d60359bd1f33dd4aaf94752cdd7c338e2b46cb91e6488df4f7c27f262ffda1789d010c7621652234be72c9813601bd0775f6e77bad04b8a7ef2d1d3be7"
    "322e32156c18d323c9b62f97e2a3792c151a5f7b677b291061ea0da8697fc00cc6977dbcb3f723ea492ae339508dfb543d731fa1c4f857f7efc0e470c3d1fe09"
)

prepare() {
    cd "${_pkgname}-${pkgver}"

    for _patch in "${srcdir}/"[0-9][0-9]-*.patch; do
        patch --forward --strip=1 --input="${_patch}"
    done

    gradle --quiet clean
}

build() {
    cd "${_pkgname}-${pkgver}"
    gradle --quiet assemble
    gradle --quiet shadowJar
}

check() {
    cd "${_pkgname}-${pkgver}"
    gradle --quiet check
}

package() {
    install \
        -Dm0644 \
        "${_pkgname}-${pkgver}/build/libs/${_pkgname}-v${pkgver}-all.jar" \
        "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-v${pkgver}-all.jar"

    ln -s \
        "/usr/share/java/${_pkgname}/${_pkgname}-v${pkgver}-all.jar" \
        "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-all.jar"

    install \
        -Dm0644 \
        "${_pkgname}-${pkgver}/analysis.properties.template" \
        "${pkgdir}/etc/${_pkgname}/analysis.properties"

    install \
        -Dm0644 \
        "${_pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install \
        -Dm0644 \
        r5-backend.sysusers \
        "${pkgdir}/usr/lib/sysusers.d/r5-backend.conf"

    install \
        -Dm0644 \
        r5-backend.service \
        "${pkgdir}/usr/lib/systemd/system/r5-backend.service"
}
