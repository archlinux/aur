# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fernflower-bin
pkgver=261.23567.138
pkgrel=1
pkgdesc="Analytical decompiler for Java bytecode by JetBrains"
arch=('any')
url="https://github.com/JetBrains/fernflower"
license=('Apache-2.0')
depends=('java-runtime>=21')
provides=('fernflower')
conflicts=('fernflower' 'fernflower-git')
options=('!debug')

_repobase="https://www.jetbrains.com/intellij-repository/releases/com/jetbrains/intellij/java/java-decompiler-engine"
source=("${pkgname}-${pkgver}.jar::${_repobase}/${pkgver}/java-decompiler-engine-${pkgver}.jar")
sha256sums=('42c80bd7ffbd27f156f949040da2db04c5d1c230a05931cc4bf75d10adeb1cb0')
noextract=("${pkgname}-${pkgver}.jar")

latestver() {
    curl -fsSL "${_repobase}/maven-metadata.xml" |
    sed -n 's/.*<latest>\(.*\)<\/latest>.*/\1/p'
}

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/fernflower/fernflower.jar"

    # Wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/fernflower" << 'WRAPPER'
#!/bin/sh
exec java -jar /usr/share/java/fernflower/fernflower.jar "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/fernflower"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
Copyright 2000-2025 JetBrains s.r.o. and contributors.
Use of this source code is governed by the Apache 2.0 license.
https://www.apache.org/licenses/LICENSE-2.0
EOF
}
