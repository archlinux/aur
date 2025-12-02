# Maintainer:
# Contributor: Jake <aur@ja-ke.tech>

: ${_install_path:=opt}

_pkgname="octoprint"
pkgname="$_pkgname-venv"
pkgver=1.11.5
pkgrel=1
pkgdesc="Web interface for 3D printers (venv installation type)"
url="https://github.com/OctoPrint/OctoPrint"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=('python')
optdepends=(
  'ffmpeg: timelapse support'
  'mjpg-streamer: stream images from webcam'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/releases/download/${pkgver}/OctoPrint-${pkgver}.source.tar.gz")
sha256sums=('5410e19777236a4c57670981f1f3f92675b97133c5de9a71f89a433ef2971c46')

package() {
  local _venv_path="$pkgdir/$_install_path/$_pkgname"

  cd "$_pkgsrc"

  python -m venv "$_venv_path"
  "$_venv_path/bin/pip3" install --no-compile .

  # compile separately for path adjustment
  python -m compileall -f -o 0 -o 1 -p / -s "$pkgdir" "$pkgdir/"

  # unwanted files
  rm -f "$_venv_path/.gitignore"

  # relocate venv (remove build paths)
  sed -e "s|$_venv_path|/$_install_path/$_pkgname|g" \
    -i "$_venv_path"/pyvenv.cfg \
    "$_venv_path"/bin/*

  # config directory
  mkdir -pm755 "$pkgdir/var/lib/octoprint" "$pkgdir/etc/"
  ln -s /var/lib/octoprint/.octoprint "${pkgdir}/etc/octoprint"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/octoprint.service" << END
[Unit]
Description=3D Printing Web Server
After=network.target

[Service]
User=octoprint
Group=octoprint
Type=simple
ExecStart=/$_install_path/$_pkgname/bin/python -m octoprint serve
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/octoprint.conf" << END
u octoprint - "OctoPrint 3D Print Server User" /var/lib/octoprint
m octoprint uucp
m octoprint network
m octoprint tty
END

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/octoprint.conf" << END
d    /var/lib/octoprint - octoprint octoprint - -
d    /var/lib/octoprint/.octoprint - octoprint octoprint - -
Z    /$_install_path/$_pkgname - octoprint octoprint - -
END
}
