# Maintainer: Your Name <youremail@domain.com>
pkgname=otf-tiro-indigo-git
pkgdesc="Tiro Indigo Indic Typefaces, based on the series of fonts for Harvard's Murty Classical Library of India. Includes Bangla (Bengali), Devanagari (Hindi, Sanskrit and Marathi variants), Gurmukhi (Punjabi), Kannada, Tamil and Telugu (built from source)"
pkgver=1.65.r0.gbb6971b # This will be dynamically updated by pkgver()
pkgrel=1
arch=('any')
url="https://github.com/TiroTypeworks/Indigo"
license=('OFL')
provides=('otf-tiro-indigo')
conflicts=('otf-tiro-indigo' 'otf-tiro-indigo-bin')
makedepends=('git' 'python' 'python-pip')
source=("${pkgname%-git}::git+https://github.com/TiroTypeworks/Indigo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Dynamically generate the version based on git tags (e.g., 1.65.r0.gbb6971b)
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  
  # Create a virtual environment inside the source directory.
  # This perfectly matches the README's build instructions and safely installs 
  # complex font-building modules without dirtying your system Python environment.
  python -m venv venv
  source venv/bin/activate
  
  # Install the specific build libraries required by the developer
  pip install --upgrade pip
  pip install -r requirements.txt
  
  # Run the official python script to compile the fonts
  python tools/tirobuild.py indigo.yml
}

package() {
  cd "$srcdir/${pkgname%-git}"

  # Create the target directory for otf files
  local fontdir="$pkgdir/usr/share/fonts/TiroIndigo-otf"
  install -d "$fontdir"
  
  # The build script outputs fonts in multiple formats into the /output directory.
  # We use `find` to grab only the .otf files and install them to the system fonts path.
  find output -type f -name "*.otf" -exec install -m644 {} -t "$fontdir" \;

  # Install the license. 
  # Note: Unlike the release .zip, the Git source repo uses 'LICENSES.txt'
  install -Dm644 LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
