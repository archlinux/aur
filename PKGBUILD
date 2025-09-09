# Maintainer: Gabriel Ruas Santos <gabrielruass@protonmail.com>
pkgname=gnu-shark
pkgver=1.0.0
pkgrel=1
pkgdesc="HUB de drivers, otimizações e utilitários para jogos no Linux (GTK)"
arch=('any')
url="https://github.com/gabriel-ruas-santos/gnu-shark"
license=('GPL3')
depends=(
  'python' 'gtk3' 'python-gobject'
  'polkit' 'flatpak'                # usados em tempo de execução
  'bash' 'coreutils' 'grep' 'sed'   # utilitários básicos
)
optdepends=(
  'expect: interação automática com prompts de pacman/pamac'
  'pamac-gtk: backend alternativo de instalação'
  'paru: helper AUR'
  'yay: helper AUR'
  'zenity: diálogos gráficos adicionais'
)
source=(
  "gnu-shark-${pkgver}.tar.gz::https://github.com/gabriel-ruas-santos/gnu-shark/archive/refs/tags/v${pkgver}.tar.gz"
  "org.gnushark.GNUShark.desktop"
  "org.gnushark.runroot.policy"
  "gnushark-runroot.sh"
)
sha256sums=('e72516ccccc6a4809866289a42638fcd01b58a21298dde73693c75dce1c89e3d'
            '0687c1ada77d452ad77e624f47e8bd736a3416a8b89baf0128bf47742d4216f2'
            'dd5f739fa30a69119c104d4d2fa65e316eeef8ac2636eaeb345c72c53ebcafe2'
            'af7247d6569fb180affdaa4d2886774d0d1e7e8d3ef8cf2ef7eb4c62cb6ae668')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # nada a compilar
}

package() {
  cd "${srcdir}/gnu-shark-${pkgver}"

  # 1) Instala todo o projeto em /usr/share/gnushark
  install -d "${pkgdir}/usr/share/gnushark"
  cp -r . "${pkgdir}/usr/share/gnushark"
  find "${pkgdir}/usr/share/gnushark" -type f -name '*.py' -exec chmod 0644 {} +

  # 2) Cria um launcher robusto em /usr/bin/gnu-shark
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/gnu-shark" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
APPDIR="/usr/share/gnushark"
export PYTHONPATH="$APPDIR:${PYTHONPATH:-}"

# Tente por módulo (se for pacote Python)
for mod in gnushark gnu_shark; do
  if [ -d "$APPDIR/$mod" ]; then
    exec python3 -m "$mod" "$@"
  fi
done

# Tente por arquivo comum
for entry in gnu_shark.py gnushark.py main.py app.py; do
  if [ -f "$APPDIR/$entry" ]; then
    exec python3 "$APPDIR/$entry" "$@"
  fi
done

echo "GNU/Shark: não encontrei entrypoint em $APPDIR (módulos gnushark/gnu_shark ou arquivos gnu_shark.py/gnushark.py/main.py/app.py)." >&2
exit 1
EOF

  # desktop + metainfo
  install -Dm644 "packaging/org.gnushark.GNUShark.desktop" \
    "${pkgdir}/usr/share/applications/org.gnushark.GNUShark.desktop"
  install -Dm644 "packaging/org.gnushark.GNUShark.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/org.gnushark.GNUShark.metainfo.xml"

  # polkit (action + wrapper)
  install -Dm644 "packaging/polkit/org.gnushark.runroot.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/org.gnushark.runroot.policy"
  install -Dm755 "packaging/polkit/gnushark-runroot" \
    "${pkgdir}/usr/libexec/gnushark-runroot"

  # exemplo de licença (ajuste conforme o arquivo de LICENSE do repositório)
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
