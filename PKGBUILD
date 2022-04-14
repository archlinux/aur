# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5
_pkgname=${pkgname#java-}
pkgver=6.7
pkgrel=1

pkgdesc="Conveyal R5 Routing Engine"
url="https://github.com/conveyal/r5"
license=("MIT")

arch=("any")

depends=("jdk11-openjdk" "java-environment")
makedepends=("gradle" "git")

source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/conveyal/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "01-don-t-try-to-guess-git-version_v6.7.patch"
    "r5-backend.service"
    "r5-backend.sysusers"

)
sha512sums=(
    "4f6964048ef6da15f947bd6ef07a44e203f5980d66fab8c5a6416b9355d7b6665ab2ed0777c819cb459086d882ba934053e91c99bc8fac0248bf12dbadd2fb89"
    "7b2bc1011e204bd9099c53aaad8afbf0519ac76e8e59ffaa04436893727aa0f417d1ac51db743ed1cce0d6c0ccbf777c4b1905b43166ea53f0c2dfb00d715430"
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
