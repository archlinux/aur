# Maintainer: Aaron Bockelie <aaronsb@gmail.com>

pkgname=ya-claude
pkgver=1.28929.0
pkgrel=1
pkgdesc="Claude Desktop from Anthropic's official Debian build, verified at build time against their signed apt index"
arch=('x86_64')
url="https://claude.com/download"
license=('LicenseRef-Proprietary')

# Fingerprint of "Anthropic Claude Code Release Signing <security@anthropic.com>",
# cross-checked against four independent sources on 2026-08-12: the published
# install docs, downloads.claude.ai/claude-desktop/key.asc, the InRelease
# signature itself, and the key embedded in the .deb's own postinst.
_fpr='31DDDE24DDFAB679F42D7BD2BAA929FF1A7ECACE'

_apt="https://downloads.claude.ai/claude-desktop/apt/stable"
_deb="claude-desktop_${pkgver}_amd64.deb"

# virtiofsd is a hard dependency, not a Cowork option: the app resolves it from
# /usr/libexec then /usr/bin and only falls back to its own bundled copy on
# Ubuntu 22.x, so on Arch the system binary is the only one ever reached.
# Verified by reading the resolver in resources/app.asar (1.28929.0).
#
# libgcc + libstdc++ rather than gcc-libs: that is now a metapackage pulling
# libasan/libtsan/libubsan/libgfortran/libquadmath, none of which are linked.
# libsecret and libnotify carry no NEEDED entry but appear as dlopen strings.
# libdrm, libxtst and util-linux-libs are upstream Depends we could not confirm
# independently; kept on upstream's authority rather than dropped.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
         'gtk3' 'hicolor-icon-theme' 'libcap-ng' 'libcups' 'libdrm' 'libgcc'
         'libnotify' 'libseccomp' 'libsecret' 'libstdc++' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
         'util-linux-libs' 'virtiofsd' 'xdg-desktop-portal' 'xdg-utils')

# Cowork boots a VM; without these the app reports it unsupported and the rest
# of the package still works. Kept optional so laptops don't carry QEMU.
optdepends=('qemu-system-x86: Cowork agent VM'
            'edk2-ovmf: UEFI firmware for the Cowork agent VM'
            'gnome-keyring: credential storage via Secret Service'
            'kwallet: credential storage on KDE Plasma'
            'xdg-desktop-portal-gtk: portal backend for GTK desktops'
            'xdg-desktop-portal-kde: portal backend for KDE Plasma')

provides=('claude-desktop')
conflicts=('claude-desktop' 'claude-desktop-appimage' 'claude-desktop-extra' 'claude')

# Prebuilt Electron/Chromium: stripping corrupts the V8 snapshot and embedded
# resources, and there is no source to build a -debug package from.
options=('!strip' '!debug')

source=("${_deb}::${_apt}/pool/main/c/claude-desktop/${_deb}"
        "InRelease::${_apt}/dists/stable/InRelease"
        "Packages::${_apt}/dists/stable/main/binary-amd64/Packages"
        'anthropic-release-signing.key')

# InRelease and Packages are re-signed and appended to on every upstream
# release, so no fixed hash exists; prepare() authenticates them by signature
# instead. The .deb hash is pinned and additionally re-derived from the signed
# index, so a wrong value fails twice.
sha256sums=('3ceb391268bde9a7fec32520d349b704043166204cdd571c62d1e950701f48fc'
            'SKIP'
            'SKIP'
            'bd70a5e4a268002704024ceba7f8446024114e94f3f0bdd11c23a9e592be81c6')

noextract=("${_deb}")

prepare() {
  cd "$srcdir"

  local keyring="$srcdir/.gnupg"
  rm -rf "$keyring"
  install -dm700 "$keyring"
  gpg --homedir "$keyring" --batch --quiet --import anthropic-release-signing.key

  local got
  got=$(gpg --homedir "$keyring" --batch --with-colons --fingerprint \
        | awk -F: '/^fpr:/{print $10; exit}')
  if [[ $got != "$_fpr" ]]; then
    echo "==> signing key is not Anthropic's: $got" >&2
    return 1
  fi

  gpg --homedir "$keyring" --batch --verify InRelease >/dev/null 2>&1 || {
    echo "==> InRelease signature did not verify" >&2
    return 1
  }

  # InRelease authenticates Packages; Packages authenticates the .deb. Scope the
  # lookup to the SHA256 block — the same filenames recur under SHA512.
  local want
  want=$(awk '/^SHA256:/{s=1;next} /^[A-Za-z][A-Za-z0-9-]*:/{s=0}
              s && $3=="main/binary-amd64/Packages" && length($1)==64 {print $1; exit}' InRelease)
  if [[ -z $want ]] || ! echo "${want}  Packages" | sha256sum -c --status -; then
    echo "==> Packages does not match the hash InRelease signs for it" >&2
    return 1
  fi

  local signed
  signed=$(awk -v v="$pkgver" '
      /^$/          { if (ver==v && sum!="") { print sum; exit } ver=""; sum=""; next }
      $1=="Version:"{ ver=$2 }
      $1=="SHA256:" { sum=$2 }
      END           { if (ver==v && sum!="") print sum }' Packages)
  if [[ $signed != "${sha256sums[0]}" ]]; then
    echo "==> ${pkgver} hash in the signed index (${signed:-none}) != pinned ${sha256sums[0]}" >&2
    return 1
  fi

  echo "==> verified ${_deb} against Anthropic's signed index"
}

package() {
  cd "$srcdir"

  # Only the payload. The maintainer scripts register an apt repository and
  # install an AppArmor profile gated on Ubuntu's userns restriction; neither
  # applies here.
  bsdtar -xOf "${_deb}" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

  # Chromium's setuid sandbox helper, for kernels without unprivileged userns.
  chmod 4755 "$pkgdir/usr/lib/claude-desktop/chrome-sandbox"

  rm -r "$pkgdir/usr/share/lintian"

  # Arch installs virtiofsd outside the two paths the app searches.
  install -d "$pkgdir/usr/bin"
  ln -s ../lib/virtiofsd "$pkgdir/usr/bin/virtiofsd"

  # The app opens Debian's firmware names under /usr/share/OVMF, which on Arch
  # is a compat symlink to /usr/share/edk2; the files themselves live in x64/
  # under different names. It derives the VARS path from the CODE path by
  # substring replacement, so both links are required.
  # Verified against edk2-ovmf 202605 on 2026-08-12.
  #
  # namcap reports these two as dangling, because edk2-ovmf is an optdepend
  # rather than a depend — the alternative is forcing ~400 MB of QEMU onto
  # hosts that will never run Cowork. Unresolved, the app reads no firmware
  # and reports Cowork unsupported, which is accurate. CI allows exactly
  # these two errors.
  install -d "$pkgdir/usr/share/edk2"
  ln -s x64/OVMF_CODE.4m.fd "$pkgdir/usr/share/edk2/OVMF_CODE_4M.fd"
  ln -s x64/OVMF_VARS.4m.fd "$pkgdir/usr/share/edk2/OVMF_VARS_4M.fd"

  install -Dm644 "$pkgdir/usr/share/doc/claude-desktop/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
