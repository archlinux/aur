# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Hao Long <aur@esd.cc>

pkgname=archivebox
pkgver=0.7.3
pkgrel=2
pkgdesc='Open source self-hosted web archiving'
arch=('x86_64' 'aarch64')
url='https://github.com/ArchiveBox/ArchiveBox'
license=('MIT')
depends=(
  'chromium'
  'curl'
  'ffmpeg'
  'nodejs'
  'procps-ng'
  'postlight-parser'
  'readability-extractor'
  'ripgrep'
  'single-file-cli'
  'wget'
  'yt-dlp'

  # Starting v0.7.3-2, this AUR package will use Python 3.11.x which is also available in the AUR.
  # The dependencies of ArchiveBox such as Django and SQLite function calls are only compatible with Python 3.11.x.
  # The upstream did not made further attempts to backport archivebox 0.7.x branch to the latest Python
  # and instead proceeded with the 0.8.x dev branch and the soon to be released 0.9.x branch.
  # All prior Python modules managed by pacman are dropped because those only work with latest Python.
  # We will use pip to download the dependencies during installation.
  # The caveat is you need to be online during installation.
  'python311'
)
makedepends=('git')
options=(!buildflags !debug !makeflags !strip)
source=(
  "git+$url.git#tag=v$pkgver"
  'archivebox-pre.hook'
  'archivebox-post.hook'
)
sha256sums=(
  '5a530b3e86332db33b24b675e98d9b8b3d0bd9148095aa3025495952c1d16834'
  'dc6bfa6d11ac085d6871b7e6fb8641e945fd7ebef429b4f50c1d57ee9084d67b'
  '8aec6b06fe483d080cc14b8ccb8b02b112c0524826db4c38fc7249df24dfbf7b'
)

prepare() {
  cd 'ArchiveBox'

  git submodule init
  git config --remove-section submodule.brew_dist
  git config --remove-section submodule.deb_dist
  git config --remove-section submodule.docker
  git config --remove-section submodule.pip_dist
  git submodule update --init --recursive

  {
    echo '[tool.pdm.build]'
    echo 'excludes = ['
    echo '  "archivebox/vendor/base32-crockford",'
    echo '  "archivebox/vendor/django-taggit",'
    echo '  "archivebox/vendor/pocket",'
    echo '  "archivebox/vendor/python-atomicwrites",'
    echo ']'
  } >> pyproject.toml

  python3.11 -m venv venv
  ./venv/bin/pip install --upgrade --no-compile --no-cache-dir pip build pdm-backend installer
  ./venv/bin/pip install --upgrade --no-compile --no-cache-dir -r requirements.txt
}

build() {
  cd 'ArchiveBox'
  ./venv/bin/python -m build --wheel
  ./venv/bin/python -m installer dist/*.whl
}

# Starting v0.7.3-2, check function is disabled to speed up installation.
# We may use this again if there's a compelling reason to do so.
#
# check() {
#   cd 'ArchiveBox'
#   ./venv/bin/pip install --upgrade --no-cache-dir pytest bottle
#   PATH="$PWD/venv/bin:$PATH" ./venv/bin/python -m pytest tests
#   ./venv/bin/pip uninstall --yes pytest bottle
# }

package() {
  cd 'ArchiveBox'

  #############
  # 1. CLEANUP
  #############

  # Remove build related Python modules
  ./venv/bin/pip uninstall --yes build pdm-backend installer setuptools pip

  # Remove bytecode cache remnants
  find "$srcdir/ArchiveBox/venv" -type d -name "__pycache__" -exec rm -rf {} +

  # Remove venv activate scripts as it may be executed by outside apps
  find "$srcdir/ArchiveBox/venv/bin" -type f -iname "activate*" -delete

  # Remove share docs and completions from other Python modules (yt_dlp)
  rm -r "$srcdir/ArchiveBox/venv/share"

  # Silence namcap warning
  rm -r "$srcdir/ArchiveBox/venv/include"


  ################
  # 2. COPY FILES
  ################

  # Copy to /opt/archivebox
  install -dm755 "$pkgdir/opt/archivebox"
  cp -a -t "$pkgdir/opt/archivebox" venv/*

  # Copy license and docs
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  rm docs/README.md # remove redundant symbolic link
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" ./etc ./docs/*.md ./*.md

  # Install hook file that aborts upgrade/removal if archivebox is running
  install -Dm644 "$srcdir/archivebox-pre.hook" "$pkgdir/usr/share/libalpm/hooks/archivebox-pre.hook"
  install -Dm644 "$srcdir/archivebox-post.hook" "$pkgdir/usr/share/libalpm/hooks/archivebox-post.hook"


  #################
  # 3. LINK BINARY
  #################
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/archivebox/bin/archivebox "$pkgdir/usr/bin/archivebox"


  ################
  # 4. FIX PATHS
  ################

  # Fix shebangs and paths to point to /opt/archivebox
  find "$pkgdir/opt/archivebox/bin" -type f -exec sed -i "s|$srcdir/ArchiveBox/venv|/opt/archivebox|g" {} +
  sed -i "s|$srcdir/ArchiveBox/venv|/opt/archivebox|g" "$pkgdir/opt/archivebox/pyvenv.cfg"

  # Fix binary paths of the sample config files
  sed -i "s|/usr/local/bin/archivebox|/usr/bin/archivebox|g" "$pkgdir/usr/share/doc/$pkgname/etc/archivebox.service"
  sed -i "s|/usr/local/bin/archivebox|/usr/bin/archivebox|g" "$pkgdir/usr/share/doc/$pkgname/etc/crontabs/archivebox"
}
