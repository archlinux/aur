pkgname=ensime-server
pkgver=0.9.10
_scalaver=2.11
_kind=SNAPSHOT
pkgrel=8
pkgdesc="ENSIME server"
url="https://github.com/ensime/ensime-server"
arch=("x86_64" "i686")
license=("custom")
depends=("java-environment-jdk" "scala")
_jarfile="ensime_${_scalaver}-${pkgver}-${_kind}-assembly.jar"
source=("http://ensime.typelevel.org/${_jarfile}")
noextract=("${_jarfile}")
md5sums=('27ff38cf0d5ffe830cc9b17127ebb470')
sha256sums=('7a0ee8e81deb2a13fb41dbb819efc6bdaf9ba9c57fc4c28351b78cc67fd0f4e2')

build() {
    echo ""
}

package() {
    mkdir -p "${pkgdir}/usr/lib/ensime" && \
    cp "${srcdir}/${_jarfile}" "${pkgdir}/usr/lib/ensime"

    mkdir -p "${pkgdir}/usr/bin" && cat <<SHELL > "${pkgdir}/usr/bin/ensime-server"
#!/bin/sh

exec /usr/bin/java -Densime.config=\${1:-.}/.ensime -cp /usr/lib/jvm/default/lib/tools.jar:/usr/share/scala/lib/scala-library.jar:/usr/share/scala/lib/scala-compiler.jar:/usr/share/scala/lib/scalap.jar:/usr/lib/ensime/${_jarfile} org.ensime.server.Server
SHELL
    chmod 0755 "${pkgdir}/usr/bin/ensime-server"

    mkdir -p "${pkgdir}/usr/lib/systemd/user" && cat <<SYSTEMD > "${pkgdir}/usr/lib/systemd/user/ensime-server@.service"
[Unit]
Description=ENSIME user server for %i directory

[Service]
Type=simple
ExecStartPre=/usr/bin/mkdir -p %I/.ensime_cache
ExecStartPre=/usr/bin/rm -f %I/.ensime_cache/http %I/.ensime_cache/port
ExecStart=/usr/bin/ensime-server %I

[Install]
WantedBy=default.target
SYSTEMD
}
