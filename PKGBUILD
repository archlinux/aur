# Contributor: diplomat
# Maintainer: Julian Xhokaxhiu <https://julianxhokaxhiu.com>

pkgname=open-webui
pkgver=0.11.2
pkgrel=1
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('BSD-3-Clause')
depends=('uv' 'ollama')
optdepends=('tika-server')
conflicts=('open-webui-uv' 'open-webui-git' 'open-webui-openrc' 'open-webui-no-venv' 'open-webui-dinit')
source=("LICENSE::https://raw.githubusercontent.com/open-webui/open-webui/refs/tags/v$pkgver/LICENSE"
        "${pkgname}.env"
        "${pkgname}.override"
        "${pkgname}.service"
        "${pkgname}.install"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('5f1bd74c48bf13ab0f82e177ad9e637313b92533d20ead2593d49347a47fc232'
            'ae29c92ae8f30565aa686e39cd05cd178266e3a6461ecbafe291829f675d6700'
            '576562a1788303dbdf9e3df4239ea0c43cdab39276e48542f1550f6346dae8f1'
            '8cde3e05a807e73f85d9c20183dd82dcfef7d2400d8bf3303bfef33641598b45'
            'dbf2a9e54801e598ebf9656777318ecb09ceea37c3464b692389f1c900f46f1c'
            'c22c0b924ff6ba983091b0b94b645c8fe22012170aa65e616e7c82711fed3821'
            '7ee594b5c323a55851ff79b9addbf303f1e263f68ca66538e20e72694ae2a467')
options=(!strip !debug)
install="${pkgname}.install"

_appprefix="/opt"
_appdataprefix="/var/opt"

prepare() {
cat > "${srcdir}/${pkgname}.sh" << EOF
#!/bin/sh
DATA_DIR="\${DATA_DIR:-/var/lib/${pkgname}}"
KEY_FILE="\${DATA_DIR}/secret_key"

if [ ! -f "\$KEY_FILE" ]; then
    SECRET=\$(head -c 32 /dev/urandom | base64 | tr -d "\n=")
    printf '%s\n' "\$SECRET" > "\$KEY_FILE"
    chmod 600 "\$KEY_FILE"
    echo "${pkgname}: generated new WEBUI_SECRET_KEY, saved to \$KEY_FILE"
fi

echo "${pkgname}: WEBUI_SECRET_KEY loaded from \$KEY_FILE"
export WEBUI_SECRET_KEY="\$(cat "\$KEY_FILE")"

export DATA_DIR
exec uvx --python 3.11 ${pkgname}@${pkgver} serve
EOF
}

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/${pkgname}/environment"
  install -Dm644 "${srcdir}/${pkgname}.override" "${pkgdir}/etc/${pkgname}/override"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
