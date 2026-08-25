# Maintainer: ねらひかだ <hkshirorom@yahoo.co.jp>
pkgname=letsnote-wheelpad-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Panasonic Let’s Note WheelPad circular touchpad scrolling daemon'
arch=('x86_64')
url='https://github.com/0xNOY/letsnote-wheelpad'
license=('MIT')

depends=(
  'glibc'
  'libgcc'
  'bash'
  'systemd'
  'acl'
  'util-linux'
)

makedepends=(
  'libarchive'
)

optdepends=(
  'polkit: run the migration helper through pkexec'
)

provides=("letsnote-wheelpad=${pkgver}")
conflicts=('letsnote-wheelpad' 'letsnote-wheelpad-git')

backup=(
  'etc/letsnote-wheelpad/config.toml'
)

options=(
  '!strip'
  '!debug'
)

install=letsnote-wheelpad-bin.install

_deb_file="letsnote-wheelpad_${pkgver}-1_amd64.deb"
source=(
  "${_deb_file}::https://github.com/0xNOY/letsnote-wheelpad/releases/download/v${pkgver}/${_deb_file}"
  'letsnote-wheelpad-bin.install'
  'letsnote-wheelpad-bin-guard'
  '30-letsnote-wheelpad-bin-remove.hook'
)
noextract=("${_deb_file}")
sha256sums=(
  '99e64ecee5d352e7fdee9d0c1e2624f43bf62967ffc9b56d8c4d12f7786524e3'
  '963692d01e1df2294eb7ec011eafe3b86f062bc22284a5a21101a642806e73e5'
  '62c7dfe96fc45903fd47c1d3a6cf61b37a7afc3fa32d472bfea7ed355d24e29a'
  '5e9c53d73c2ab62bf3ab4c090534874a66cb333852d4222b1a95d7a961cf9540'
)

prepare() {
  local member
  local data_members=()

  while IFS= read -r member; do
    case "$member" in
      data.tar.*|./data.tar.*) data_members+=("$member") ;;
    esac
  done < <(bsdtar -tf "$srcdir/$_deb_file")

  if (( ${#data_members[@]} != 1 )); then
    printf 'expected exactly one data.tar.* member, found %d\n' \
      "${#data_members[@]}" >&2
    return 1
  fi

  rm -r "$srcdir/debian-data" 2>/dev/null || true
  mkdir -p "$srcdir/debian-data"
  bsdtar -xOf "$srcdir/$_deb_file" "${data_members[0]}" |
    bsdtar -xf - -C "$srcdir/debian-data"
}

package() {
  local data="$srcdir/debian-data"

  install -Dm755 "$data/usr/bin/letsnote-wheelpad" \
    "$pkgdir/usr/bin/letsnote-wheelpad"
  install -Dm755 "$data/usr/libexec/letsnote-wheelpad-migrate" \
    "$pkgdir/usr/libexec/letsnote-wheelpad-migrate"
  install -Dm644 "$data/usr/lib/udev/rules.d/70-letsnote-wheelpad.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-letsnote-wheelpad.rules"
  install -Dm644 "$data/usr/lib/udev/rules.d/72-letsnote-wheelpad-system.rules" \
    "$pkgdir/usr/lib/udev/rules.d/72-letsnote-wheelpad-system.rules"
  install -Dm644 "$data/usr/lib/systemd/user/letsnote-wheelpad.service" \
    "$pkgdir/usr/lib/systemd/user/letsnote-wheelpad.service"
  install -Dm644 "$data/usr/lib/systemd/system/letsnote-wheelpad@.service" \
    "$pkgdir/usr/lib/systemd/system/letsnote-wheelpad@.service"
  install -Dm644 "$data/usr/lib/sysusers.d/letsnote-wheelpad.conf" \
    "$pkgdir/usr/lib/sysusers.d/letsnote-wheelpad.conf"
  install -Dm644 "$data/etc/letsnote-wheelpad/config.toml" \
    "$pkgdir/etc/letsnote-wheelpad/config.toml"
  install -Dm644 "$data/usr/lib/modules-load.d/letsnote-wheelpad.conf" \
    "$pkgdir/usr/lib/modules-load.d/letsnote-wheelpad.conf"
  install -Dm755 "$srcdir/letsnote-wheelpad-bin-guard" \
    "$pkgdir/usr/libexec/letsnote-wheelpad-bin-guard"
  install -Dm644 "$srcdir/30-letsnote-wheelpad-bin-remove.hook" \
    "$pkgdir/usr/share/libalpm/hooks/30-letsnote-wheelpad-bin-remove.hook"
  install -Dm644 "$data/usr/share/doc/letsnote-wheelpad/LICENSE" \
    "$pkgdir/usr/share/licenses/letsnote-wheelpad-bin/LICENSE"
  install -Dm644 "$data/usr/share/doc/letsnote-wheelpad/README.md" \
    "$pkgdir/usr/share/doc/letsnote-wheelpad/README.md"
  install -Dm644 "$data/usr/share/doc/letsnote-wheelpad/README.ja.md" \
    "$pkgdir/usr/share/doc/letsnote-wheelpad/README.ja.md"
}
