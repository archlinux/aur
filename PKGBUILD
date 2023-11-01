pkgname="openai-client-git"
_pkgname="openai-client"
pkgdesc="OpenAI client made using PySide6 Qt"
pkgver=1.0.r120.093c3f1
pkgrel=1
arch=("x86_64")

license=('MIT')

# binaries in virtual environment will be removed
# if default behaviour makepkg is not overridden
options=(!strip)

# use pacman -Qs "package-name"
depends=("git" "python" "python-pip")
makedepends=("libxkbcommon" "libxkbcommon-x11")
provides=("openai-client")

source=("git+https://github.com/anirbandey1/openai-client.git")
sha512sums=("SKIP")

  
pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  # Make necessary directories

  mkdir -pv "${pkgdir}/usr" 
  cp -rv "${srcdir}/openai-client/assets/usr/share" "${pkgdir}/usr"
  cp -rv "${srcdir}/openai-client/assets/usr/bin"   "${pkgdir}/usr"


  # Create python virtualenv

  python -m venv "${srcdir}/.venv"

  # Check if virtualenv is created
  if [ -f "${srcdir}/.venv/bin/activate" ]; then
      echo "Python virtualenv created properly"
  else
      echo "Virtual environment not created properly. Abort Install"
      exit 1
  fi

  # Install python libraries in the virtualenv

  . "${srcdir}/.venv/bin/activate"
  pip install --upgrade pip
  pip install --upgrade -r "${srcdir}/openai-client/requirements.txt"


  # Convert python source code to executable using pyinstaller

  cd "${srcdir}/openai-client"
  pyinstaller -F "${srcdir}/openai-client/main.py"

  install -Dm 755 "${srcdir}/openai-client/dist/main" "${pkgdir}/opt/openai-client/main"




}


