# Maintainer: Julian Xhokaxhiu <https://julianxhokaxhiu.com>

_intpkgname=open-webui
pkgname=$_intpkgname-uv
pkgver=0.9.5
pkgrel=2
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('BSD-3-Clause')
depends=('uv')
conflicts=('open-webui' 'open-webui-git' 'open-webui-openrc' 'open-webui-no-venv' 'open-webui-dinit')
source=("LICENSE::https://raw.githubusercontent.com/open-webui/open-webui/refs/tags/v$pkgver/LICENSE"
        "${_intpkgname}.env"
        "${_intpkgname}.service"
        "${_intpkgname}.install"
        "${_intpkgname}.sysusers"
        "${_intpkgname}.tmpfiles")
sha256sums=('5f1bd74c48bf13ab0f82e177ad9e637313b92533d20ead2593d49347a47fc232'
            '47382a36a9dc39dbf6cdd0c41bbf8312d93d0f7ff560018f7555114a531ffb12'
            'bff99ba962012babcf1b3f1666c745e99179d34bbe2aebf90c4424a3e606c8e6'
            'dbf2a9e54801e598ebf9656777318ecb09ceea37c3464b692389f1c900f46f1c'
            'c22c0b924ff6ba983091b0b94b645c8fe22012170aa65e616e7c82711fed3821'
            '7ee594b5c323a55851ff79b9addbf303f1e263f68ca66538e20e72694ae2a467')
options=(!strip !debug)
install="${_intpkgname}.install"

prepare() {
cat > "${srcdir}/${_intpkgname}.sh" << EOF
#!/bin/sh
DATA_DIR="\${DATA_DIR:-/var/lib/${_intpkgname}}"
KEY_FILE="\${DATA_DIR}/secret_key"

if [ ! -f "\$KEY_FILE" ]; then
    SECRET=\$(head -c 32 /dev/urandom | base64 | tr -d "\n=")
    printf '%s\n' "\$SECRET" > "\$KEY_FILE"
    chmod 600 "\$KEY_FILE"
    echo "${_intpkgname}: generated new WEBUI_SECRET_KEY, saved to \$KEY_FILE"
fi

echo "${_intpkgname}: WEBUI_SECRET_KEY loaded from \$KEY_FILE"
export WEBUI_SECRET_KEY="\$(cat "\$KEY_FILE")"

export DATA_DIR
exec uvx --python 3.11 ${_intpkgname}@${pkgver} serve
EOF
}

package() {
  install -Dm755 "${srcdir}/${_intpkgname}.sh" "${pkgdir}/usr/bin/${_intpkgname}"
  install -Dm644 "${srcdir}/${_intpkgname}.env" "${pkgdir}/etc/${_intpkgname}/environment"
  install -Dm644 "${srcdir}/${_intpkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_intpkgname}.service"
  install -Dm644 "${srcdir}/${_intpkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_intpkgname}.conf"
  install -Dm644 "${srcdir}/${_intpkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_intpkgname}.conf"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
