# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium built from a release tag, as two packages, the console and its
# terminfo entry (ADR-1500 D3). The maintainer signs the tag with the PGP
# key in validpgpkeys, and makepkg checks the tag's signature before it
# builds. Import the key once: gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
# VTIUM_FEATURES in makepkg's environment names the console's features.
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).

pkgbase=vtium
pkgname=('vtium' 'vtium-terminfo')
_tag=v0.1.0-alpha.1
pkgver=0.1.0alpha.1
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM'
arch=('x86_64')
url='https://github.com/vtium/vtium'
license=('MIT')
makedepends=('cargo' 'git' 'ncurses' 'libxkbcommon' 'systemd-libs')
options=('!debug')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

package_vtium() {
  depends=('glibc' 'libgcc' 'libxkbcommon' 'systemd-libs' 'vtium-terminfo')
  optdepends=('kbd: console fonts, which vtium draws when no frit is set'
              'kmscon-terminfo: the terminfo entry kmscon, for sessions run with term=kmscon')
  conflicts=('vtium-git')
  install=vtium.install
  _package_console
}

package_vtium-terminfo() {
  arch=('any')
  pkgdesc='The terminfo entry xterm-vtium, for sessions in vtium'
  _package_terminfo
}

# Everything below is the same in vtium-git/PKGBUILD and vtium/PKGBUILD;
# aur-publish refuses a package whose copy differs from the other's.

prepare() {
  cd vtium
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd vtium
  # vtium starts its glyph helper, and reads its frits, at paths fixed when
  # it is built (crates/vtium/src/helper.rs, crates/vtium/src/font.rs).
  # VTIUM_REVISION is the package's version, so the journal's Revision line
  # at start names what pacman -Q names (ADR-1500 D2).
  export VTIUM_VITRIFY=/usr/bin/vtium-vitrify VTIUM_FONT_FRITS=/etc/vtium/fonts
  export VTIUM_REVISION="$pkgver" CARGO_TARGET_DIR=target
  # The minspec profile, vtium's default build, with packed relative
  # relocations for the console alone, as vtium's Makefile builds it.
  # VTIUM_FEATURES in makepkg's environment names other features, such as
  # VTIUM_FEATURES='images logind'.
  cargo rustc --frozen --profile minspec -p vtium --bin vtium \
    ${VTIUM_FEATURES:+--features "$VTIUM_FEATURES"} -- -C link-arg=-Wl,-z,pack-relative-relocs
  cargo build --frozen --release -p vtium-vitrify
  grep -qaF "$VTIUM_REVISION" target/minspec/vtium || {
    echo "target/minspec/vtium does not carry the revision $VTIUM_REVISION" >&2
    return 1
  }
}

# The console, its helper, its units, its documentation and the license.
_package_console() {
  cd vtium
  install -Dm755 target/minspec/vtium "$pkgdir/usr/bin/vtium"
  install -Dm755 target/release/vtium-vitrify "$pkgdir/usr/bin/vtium-vitrify"

  # vtium@.service and vtium-getty@.service are the shipped kmsconvt@ units
  # under vtium's own names, changed as vtium's tools/vt/units.sh changes
  # them (ADR-1500 D3): OnFailure= names vtium-getty@; a Conflicts= and an
  # After= line naming kmsconvt@%i.service go just above OnFailure=, so
  # starting vtium on a VT stops the C reference's console there first;
  # and the shipped DefaultInstance=tty1 gives way, at the end of
  # [Install], to DefaultInstance=name-a-VT/vtium@ttyN, which names no VT.
  # systemctl refuses that value when it enables the template, before it
  # links anything, and ignores it when it enables an instance, so
  # systemctl enable vtium@.service with no VT named links nothing on any
  # machine, while enable vtium@ttyN makes autovt@ttyN and the getty.target
  # want as before. With no DefaultInstance= at all, systemctl would link
  # autovt@.service -> vtium@.service on a machine that has no such link
  # before it refused the template, and logind would then start vtium on
  # every VT it spawns (measured with systemd 262; 254 links in the same
  # order). The cost: systemctl list-unit-files shows vtium@.service as
  # "bad", and is-enabled on the template fails. ExecStart= already runs
  # /usr/bin/vtium, and every other line, Alias=autovt@.service included,
  # stays as shipped. The kmscon package keeps the kmsconvt@ names.
  local src=crates/vtium/install units="$pkgdir/usr/lib/systemd/system"
  local rev; rev=$(git rev-parse --short=7 HEAD)
  [ "$(grep -c '^ExecStart=/usr/bin/vtium ' "$src/kmsconvt@.service")" = 1 ] &&
    [ "$(grep -cx 'OnFailure=kmsconvt-getty@%i\.service' "$src/kmsconvt@.service")" = 1 ] &&
    [ "$(grep '^\[' "$src/kmsconvt@.service" | tail -n1)" = "[Install]" ] || {
    echo "the shipped kmsconvt@.service changed shape: no one ExecStart=/usr/bin/vtium or OnFailure=kmsconvt-getty@%i.service line, or [Install] is not its last section" >&2
    return 1
  }
  install -dm755 "$units"
  # Each shipped unit opens with a comment that names the C reference's
  # units; the packaged units open with their own, and keep the rest.
  local body='started || /^\[/ { started = 1; print }'
  {
    printf '# Generated by the %s package from crates/vtium/install/kmsconvt@.service at %s. Changed from it:\n' "$pkgname" "$rev"
    printf '#   the name, vtium@\n#   the getty fallback, vtium-getty@\n'
    printf '#   Conflicts= and After= kmsconvt@%%i.service\n#   DefaultInstance=name-a-VT/vtium@ttyN, which is no VT\n'
    printf '#   its opening comment, which says what the unit does under its own name\n'
    cat <<'EOF'
# vtium on one VT of seat0, in place of its getty. The instance is the VT's
# name, as getty@.service's is. vtium console gives vtium one VT, or every
# VT, and takes them back (ADR-1500 D7):
#   vtium console enable 3
#   vtium console enable --all
#   vtium console disable 3
#   vtium console disable --all
# vtium console enable 3 enables vtium@tty3.service, which also links
# autovt@tty3.service here, so logind starts vtium on that VT. Enabling
# vtium@.service with no VT named fails and links nothing, because its
# DefaultInstance= names no VT.
# It conflicts with getty@ on the same VT. When vtium fails, its OnFailure=
# starts vtium-getty@, which starts getty@ on the VT unless the head file's
# policy is closed (ADR-1401 D9), and a Restart= line, where the unit has
# one, starts vtium again first. Without VTs it starts nothing. The unit sets
# no sandboxing directive: the login session vtium starts would inherit it
# (ADR-1400, D3).

EOF
    awk "$body" "$src/kmsconvt@.service" |
      sed -e 's/^OnFailure=kmsconvt-getty@%i\.service$/Conflicts=kmsconvt@%i.service\nAfter=kmsconvt@%i.service\nOnFailure=vtium-getty@%i.service/' \
          -e '/^DefaultInstance=/d'
    printf '# No VT: systemctl refuses it, so enabling vtium@.service with no VT\n'
    printf '# named fails and links nothing. Name the VT: vtium@tty3.service.\n'
    printf 'DefaultInstance=name-a-VT/vtium@ttyN\n'
  } >"$units/vtium@.service"
  {
    printf '# Generated by the %s package from crates/vtium/install/kmsconvt-getty@.service at %s. Changed from it:\n' "$pkgname" "$rev"
    printf '#   the name, vtium-getty@, which vtium@.service names as its fallback\n'
    printf '#   its opening comment, which says what the unit does under its own name\n'
    cat <<'EOF'
# The getty fallback of vtium@.service: when vtium on a VT fails, its
# OnFailure= starts this unit, which starts getty@ on that VT, so a user is
# never left at a dead screen. Under a closed head-file policy a getty's
# login would take any keyboard (ADR-1401 D9), so vtium writes
# /run/vtium/ttyN.closed at start, and this unit's condition skips the getty
# while that file exists. vtium removes the file when it next starts under an
# open policy, and /run is cleared at every boot.

EOF
    awk "$body" "$src/kmsconvt-getty@.service"
  } >"$units/vtium-getty@.service"
  chmod 644 "$units/vtium@.service" "$units/vtium-getty@.service"
  ! grep -h -v '^# Generated by ' "$units/vtium@.service" "$units/vtium-getty@.service" |
    grep -v 'kmsconvt@%i\.service' | grep -q 'kmsconvt' &&
    [ "$(grep '^DefaultInstance=' "$units/vtium@.service")" = 'DefaultInstance=name-a-VT/vtium@ttyN' ] || {
    echo "a generated unit still names kmsconvt, in a line or a comment, or vtium@.service has no one refused DefaultInstance=" >&2
    return 1
  }

  # The C reference's package owns /etc/kmscon/kmscon.conf.example, so the
  # example goes under vtium's own name.
  install -Dm644 "$src/kmscon.conf.example" "$pkgdir/usr/share/doc/vtium/kmscon.conf.example"
  install -Dm644 -t "$pkgdir/usr/share/doc/vtium/examples" "$src/examples/71-vtium-local.rules" "$src/examples/vtium.hwdb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vtium's terminfo entry, compiled under its name xterm-vtium, and the
# license (ADR-1500 D3). No package ships an entry named kmscon: the
# kmscon-terminfo package keeps that name.
_package_terminfo() {
  cd vtium
  local ti=crates/vtium/install/xterm-vtium.ti
  [ -f "$ti" ] || {
    echo "the source has no $ti, so there is no xterm-vtium entry to package; vtium's main gains it with the work that names vtium TERM=xterm-vtium" >&2
    return 1
  }
  install -dm755 "$pkgdir/usr/share/terminfo"
  tic -x -e xterm-vtium -o "$pkgdir/usr/share/terminfo" "$ti"
  [ -f "$pkgdir/usr/share/terminfo/x/xterm-vtium" ] || {
    echo "tic did not compile xterm-vtium" >&2
    return 1
  }
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
