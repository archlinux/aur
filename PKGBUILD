pkgname=ensime-server
pkgver=0.9.10
_scalaver=2.11.6
_kind=SNAPSHOT
pkgrel=5
pkgdesc="ENSIME server"
url="https://github.com/ensime/ensime-server"
arch=("x86_64" "i686")
license="custom"
depends=("java-environment-jdk")
_jarfile="ensime_${_scalaver}-${pkgver}-${_kind}-assembly.jar"
source=("http://ensime.typelevel.org/${_jarfile}")
noextract=("${_jarfile}")
md5sums=('a40de1ec974ad6181f6d4cbe25b29ad0')
sha256sums=('517bf1567e281fcbedd8aaa7298259fada77249df8c661c502a00b2c469deb40')

build() {
    echo ""
}

package() {
    mkdir -p "${pkgdir}/usr/lib/ensime" && \
    cp "${srcdir}/${_jarfile}" "${pkgdir}/usr/lib/ensime"

    mkdir -p "${pkgdir}/usr/bin" && cat <<SHELL > "${pkgdir}/usr/bin/ensime-server"
#!/bin/sh

exec /usr/bin/java -Densime.config=\${1:-.}/.ensime -cp /usr/lib/jvm/default/lib/tools.jar:/usr/lib/ensime/${_jarfile} org.ensime.server.Server
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
