# Maintainer: André Kugland <kugland at gmail dot com>
# Maintainer: Vej Kse <vej.kse at gmail dot com>

#  This package is provided as a workaround because ffsubsync
#  doesn't work correctly with the most recent version of
#  auditok. In this package, it is installed, together with
#  auditok as a Python virtual environment inside the
#  directory /usr/share/ffsubsync-venv. All other dependencies
#  are taken from the system.

_pkgname=ffsubsync-venv
pkgname=python-$_pkgname
pkgver=0.4.29
pkgrel=1
pkgdesc="Language-agnostic automatic synchronization of subtitles with video. (Installed inside a Python virtual environment)"
arch=(any)
url="https://github.com/smacke/ffsubsync"
license=('MIT')
source=('ffs.sh')
sha256sums=('6c8226cc63e639ed29673d1436792caca0b0cbfd63d4e8baa3ab9350d4e3dfb8')
depends=(
  'python'
  'python-chardet'
  'python-charset-normalizer'
  'python-faust-cchardet'
  'python-ffmpeg-python'
  'python-numpy'
  'python-pysubs2'
  'python-rich'
  'python-srt'
  'python-tqdm'
  'python-typing_extensions'
  'python-webrtcvad'
)
conflicts=('python-ffsubsync')
install=ffsubsync-venv.install

remove_pkgdir_path() {
  # Bash function to remove "$pkgdir" from the package files.
  # Since "$pkgdir" can contain reserved characters for regex or the separator
  # used in a sed command, rather than using sed or awk, we use Bash string
  # substitution, that can be made exact by quoting the variable.
  file="$1"
  cp "$file" "$file.tmp"
  while IFS= read -r line; do
    echo "${line//"$pkgdir"}"
  done < "$file.tmp" > "$file"
  rm "$file.tmp"
}

package() {
  mkdir -p "$pkgdir"/usr/{bin,share/ffsubsync-venv}
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/ffs
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/ffsubsync
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/subsync

  venv="$pkgdir/usr/share/ffsubsync-venv"
  python -m venv --system-site-packages --symlinks "$venv"
  . "$venv/bin/activate"

  pip install "ffsubsync==$pkgver"

  # Remove make dependencies from the virtual environment.
  pip uninstall --yes pip setuptools

  # Remove $pkgdir path from the package (it is important to exclude binary
  # files otherwise .pyc files will be corrupted and ffs will crash).
  export pkgdir
  export -f remove_pkgdir_path
  find "$venv" -type f \
    -exec grep --quiet --binary-files=without-match --fixed-strings "$pkgdir" {} \; \
    -exec bash -c 'remove_pkgdir_path "$1"' _ {} \;
}
