# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_rawname="SMB3-Foundry"
_pkgbase="smb3-foundry"
pkgname="${_pkgbase}"
pkgver=1.6
pkgrel=1
pkgdesc="A modern Super Mario Bros. 3 level editor"
arch=('any')
url="https://github.com/mchlnix/${_rawname}"
license=('GPL-3.0-only')
provides=(
  "${_pkgbase}"
  'smb3-scribe'
)
conflicts=("${_pkgbase}-git")
depends=(
  'sh'
  'python'
  'python-pytest'
  'python-hypothesis'
  'pyside6'
  'python-qdarkstyle'
  'python-py65'
#  'glibc'
#  'libgcc'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
#  'rust'
#  'maturin'
#  'python-installer'
)

source=(
  "git+${url}.git#tag=$pkgver"
  'smb3-foundry.sh'
  'smb3-scribe.sh'
  'smb3-foundry.desktop'
  'smb3-scribe.desktop'
  'foundry-icons.tar.gz'
  'scribe-icons.tar.gz'
)

b2sums=('SKIP'
        '2032b07037ba80c60d154ac92a380a19ed53cf1b8f312f4a8b896ac3ac6a98eb377d6062f6551830900c4a3fdbd608e75cb1a3d561fdd0c3dc6ef1dd9776fe31'
        'f3159c38269e17e1222ce219e2b42752f48adb79670073322f63bd1ecff10940154efad759ae04c8fa707c7cc0bf10f0ff2dcb93829545000f71dbc728cb9c17'
        '7f5033b30e8cf91b6d1652139a450c2aeee4a93a30a5d0f69f93bcc235d941e7b532e0eb84edfb22583af2c7bc1d318565145e8f55dd10a3b076c4330ced7a12'
        'b93fc5e7953837b8466087c097b7f2fb9e63e714b3da437be53517b57ee519a93d50fca0706ab730c95fbd285982e3e8c9eb7f2f4b739323d04770612ec1850f'
        '3ecb70bea39dd51848399acab843ad50c4dfb1b5bb3b630e543b777c943e9d07f994224036ba245bafeb3cb4028293e6734901b9300f690fc4d36e10364e250e'
        'a00917fcd714cac3a064c919bd70404bd90d3dd4399262ff0fd1714b77d5ca2652b6616930f269f2a3f599be20bb50a909773d50f7ee93eaa15a04c95bad0ec2')

build() {
  cd "$srcdir/${_rawname}"

#  export RUSTUP_TOOLCHAIN=stable

  # Build the Rust extension modules with maturin
#  for crate in r6502 rsmb3parse; do
#    msg2 "Building Rust module: $crate"
#    (
#      cd "rust/$crate"
#      maturin build --release --strip
#    )
#  done
}

package() {
  cd "$srcdir/${_rawname}"
  
  install -d "$pkgdir/usr/share/${_pkgbase}"
  
  # 1. Install the main Python application files
  for f in \
    foundry smb3parse scribe data doc \
    VERSION smb3-foundry.py smb3-scribe.py
  do
    cp -r "$f" "$pkgdir/usr/share/${_pkgbase}/"
  done

  # 2. Install the Rust extension wheels into the Python site-packages
#  for crate in r6502 rsmb3parse; do
#    msg2 "Installing Python wheel for: $crate"
#    python -m installer --destdir="$pkgdir" \
#      "rust/$crate/target/wheels/"*.whl
#  done

  # 3. Install the license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  cd ..

  # 4. Install the icons
  for size in 16 22 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "foundry_${size}.png" "${pkgdir}/usr/share/${icon_folder}/apps/smb3-foundry.png"
    install -Dm644 "scribe_${size}.png" "${pkgdir}/usr/share/${icon_folder}/apps/smb3-scribe.png"
  done

  cd ..

  # 5. Install launcher scripts in /usr/bin
  for f in *.sh; do
    install -Dm755 "$f" "$pkgdir/usr/bin/${f%.*}"
  done

  # 6. Install the desktop files
  for f in *.desktop; do
    install -Dm644 "$f" "${pkgdir}/usr/share/applications/$f"
  done
}

