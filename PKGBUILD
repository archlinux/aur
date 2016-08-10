pkgname=ensime-server
pkgver=1.0.0
_scalaver=2.11
pkgrel=1
pkgdesc="ENSIME server"
url="https://github.com/ensime/ensime-server"
arch=("x86_64" "i686")
license=("custom")
depends=("java-environment-jdk" "scala")
_jarfile="ensime_${_scalaver}-${pkgver}-assembly.jar"
source=("http://ensime.typelevel.org/${_jarfile}")
noextract=("${_jarfile}")
md5sums=('40f6b4f413b8b006d5740b1edbf41116')
sha256sums=('4c109e850977135b26108b98cf45cde08321355a147665d2a86593638b2c8bf7')

build() {
    echo ""
}

package() {
    mkdir -p "${pkgdir}/usr/lib/ensime" && \
    cp "${srcdir}/${_jarfile}" "${pkgdir}/usr/lib/ensime"

    mkdir -p "${pkgdir}/usr/bin" && cat <<SHELL > "${pkgdir}/usr/bin/ensime-server"
#!/bin/sh

PROJECT_DIR="\${1:-.}"
SWANK_PORT="\$2"
HTTP_PORT="\$3"

mkdir -p "\${PROJECT_DIR}"/.ensime_cache

if test -n "\${SWANK_PORT}"; then
    echo -n "\${SWANK_PORT}" > "\${PROJECT_DIR}"/.ensime_cache/port
fi

if test -n "\${HTTP_PORT}"; then
    echo -n "\${HTTP_PORT}" > "\${PROJECT_DIR}"/.ensime_cache/http
fi

exec /usr/bin/java -Densime.config="\${PROJECT_DIR}"/.ensime -cp /usr/lib/jvm/default/lib/tools.jar:/usr/share/scala/lib/scala-library.jar:/usr/share/scala/lib/scala-compiler.jar:/usr/share/scala/lib/scalap.jar:/usr/lib/ensime/${_jarfile} org.ensime.server.Server
SHELL
    chmod 0755 "${pkgdir}/usr/bin/ensime-server"

    mkdir -p "${pkgdir}/usr/lib/systemd/user" && cat <<SYSTEMD > "${pkgdir}/usr/lib/systemd/user/ensime-server@.service"
[Unit]
Description=ENSIME user server for %i directory

[Service]
Type=simple
EnvironmentFile=-%I/.ensime_cache/ports.conf
ExecStartPre=-/usr/bin/rm -f %I/.ensime_cache/http %I/.ensime_cache/port
ExecStart=/usr/bin/ensime-server %I \${SWANK_PORT} \${HTTP_PORT}

[Install]
WantedBy=default.target
SYSTEMD
}
