pkgname=kura-voice-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="KurA low-CPU Discord voice music bot (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/TOTO-sys28/KurA"
license=('MIT')
depends=('glibc' 'openssl' 'opus' 'systemd')
provides=('kura-voice')
conflicts=('kura-voice')
backup=('etc/kura.env')
optdepends=('ffmpeg: kurac audio conversion to .opus')
# Unique local filename per release so makepkg/yay never reuses a stale tarball (same upstream name every tag).
source_x86_64=(
  "kura-voice-${pkgver}-linux-x64.tar.gz::https://github.com/TOTO-sys28/KurA/releases/download/v${pkgver}/kura_voice-linux-x64.tar.gz"
  "kura.service"
)
sha256sums_x86_64=('SKIP' 'SKIP')

package() {
  cd "${srcdir}"

  # Tarball may ship `kura` + `kurac` (new) or `kura_voice` only (legacy)
  if [[ -f kura ]]; then
    install -Dm755 kura "${pkgdir}/usr/bin/kura"
  elif [[ -f kura_voice ]]; then
    install -Dm755 kura_voice "${pkgdir}/usr/bin/kura"
  else
    echo "Missing bot binary (expected kura or kura_voice in tarball)" >&2
    return 1
  fi
  if [[ -f kurac ]]; then
    install -Dm755 kurac "${pkgdir}/usr/bin/kurac"
  fi
  install -Dm644 kura.service "${pkgdir}/usr/lib/systemd/system/kura.service"

  install -Dm600 /dev/null "${pkgdir}/etc/kura.env"
  cat > "${pkgdir}/etc/kura.env" <<'EOF'
# KurA environment
# DISCORD_TOKEN=YOUR_TOKEN_HERE
OPUS_CACHE=/var/lib/kura/music_opus
RUST_LOG=warn
EOF

  # WSL: Windows npm shims for kura/kurac often precede /usr/bin; prefer native binaries.
  install -Dm644 /dev/null "${pkgdir}/etc/profile.d/kura-voice-bin.sh"
  cat > "${pkgdir}/etc/profile.d/kura-voice-bin.sh" <<'EOF'
#!/bin/sh
PATH="/usr/bin:/usr/local/bin:$PATH"
export PATH
EOF
  chmod 644 "${pkgdir}/etc/profile.d/kura-voice-bin.sh"

  # Interactive bash (non-login) does not source /etc/profile.d; WSL often uses this.
  install -Dm644 /dev/null "${pkgdir}/etc/bash/bashrc.d/kura-voice-bin.sh"
  cat > "${pkgdir}/etc/bash/bashrc.d/kura-voice-bin.sh" <<'EOF'
# Prefer native kura/kurac over Windows npm shims (WSL)
PATH="/usr/bin:/usr/local/bin:$PATH"
export PATH
EOF
  chmod 644 "${pkgdir}/etc/bash/bashrc.d/kura-voice-bin.sh"
}
