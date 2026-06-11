# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='silverbullet'
pkgname="$_pkgname-bin"
pkgdesc='Programmable, private, browser-based, personal knowledge management platform / wiki (pre-compiled)'
pkgver=2.9.0
pkgrel=1
url='https://github.com/silverbulletmd/silverbullet'
install="$_pkgname.install"
changelog="$_pkgname.changelog"
_rawurl='https://raw.githubusercontent.com/silverbulletmd/silverbullet/refs/heads/main'
arch=('x86_64')
license=('MIT')
provides=("$_pkgname")
conflicts=("${provides[@]}" 'sb')
backup=("etc/default/$_pkgname")
source=(
  "$_pkgname-cli-$pkgver.zip::$url/releases/download/$pkgver/sb-linux-$CARCH.zip"
  "$_pkgname-srv-$pkgver.zip::$url/releases/download/$pkgver/silverbullet-server-linux-$CARCH.zip"
  "$url/releases/download/$pkgver/CHANGELOG.md"
  "$_rawurl/LICENSE.md"
  "$_rawurl/README.md"
  'silverbullet-system.service'
  'silverbullet-user.service'
  'sysuser.conf'
  'tmpfile.conf'
)
sha256sums=(
  '2b0899fa32fbe91726dda53ba154da9921f3a4a6af7cf33b29044ecb1fc568c0'
  'fe2b27651d11833727cd1b989a666d1000bd16e805130c6c461cda4c6dc1c69d'
  'SKIP' 'SKIP' 'SKIP'
  '934853f43b399b1761d57ad4d42957863b23459f50f003cd4408c33f238ac012'
  '66bc5f51f8361eabd22aa26e5ebc86eb0d33e07196c93d423c8839b3055200d4'
  '98b3b44b51640d2dd89570a25d1c11504d4236299142510c65179d451598dcf2'
  '63a3662aefbdcee4a5be179c78116dc5c73aef7f22c06503ba85bed15a03541b'
)

build() {
  for _shell in bash fish zsh; do
    for _exe in silverbullet sb; do
      "./$_exe" completion "$_shell" > "_completions-$_exe.$_shell"
    done
  done
}

package() {
  # Executables, ChangeLog, README and LICENSE
  install -sDm0755 -t "$pkgdir/usr/bin" silverbullet sb
  install  -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGELOG.md README.md
  install  -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md

  # System user and homedir configurations
  install -Dm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"

  # Systemd unit files
  install -Dm0644 "$_pkgname-system.service" \
    "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm0644 "$_pkgname-user.service"   \
    "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

  # Runtime defaults
  install -Dm0644 /dev/stdin "$pkgdir/${backup[0]}" << EOF
# File /${backup[0]} (-*- sh -*-)
SB_HOSTNAME=localhost
SB_PORT=3000
# If a UNIX socket is configured, the host and port above are ignored
#SB_UNIX_SOCKET=/tmp/$_pkgname.sock
SB_FOLDER=/var/lib/$_pkgname
# See https://silverbullet.md/Install/Configuration for other
# configuration variables.
EOF

  # Shell completions
  for _exe in silverbullet sb; do
    install -Dm0644 "_completions-$_exe.bash" \
      "$pkgdir/usr/share/bash-completion/completions/$_exe"
    install -Dm0644 "_completions-$_exe.fish" \
      "$pkgdir/usr/share/fish/vendor_completions.d/$_exe.fish"
    install -Dm0644 "_completions-$_exe.zsh"  \
      "$pkgdir/usr/share/zsh/site-functions/_$_exe"
  done

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -sr "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
