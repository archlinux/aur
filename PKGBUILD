pkgname="openai-client-git"
_pkgname="openai-client"
pkgdesc="OpenAI client made using PySide6 Qt"
pkgver=1.0.r65.2384bcf
pkgrel=1
arch=("x86_64")


license=('MIT')


# binaries in virtual environment will be removed
# if default behaviour makepkg is not overridden
options=(!strip)

# use pacman -Qs "package-name"
depends=("git" "python" "python-pip")

provides=("openai-client")

# backup=(etc/$pkgname/{config.ini,wsetup.sh,xsetup.sh})
# backup=(~/.config/openai-client)
# backup=(home/${USER}/.config/openai-client)

source=("git+https://github.com/anirbandey1/openai-client.git")

# sha512sums=("SKIP")
sha512sums=("SKIP")


  
pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  # Make necessary directories


  # install -Dm 755 "${srcdir}/openai-client/scripts/launchers/launch_arch.sh" "${pkgdir}/usr/bin/openai-client"
  install -Dm 755 "${srcdir}/openai-client/scripts/run.sh" "${pkgdir}/usr/bin/openai-client"

  mkdir -pv "${pkgdir}/usr" 
  cp -rv "${srcdir}/openai-client/share" "${pkgdir}/usr"


  # Create python virtualenv

  # pip install --upgrade pip
  # pip install --upgrade venvs
  python -m venv "${srcdir}/.venv"


  # Check if virtualenv is created
  if [ -f "${srcdir}/.venv/bin/activate" ]; then
      echo "Good to go"
      echo "Python virtualenv created properly"
  else
      echo "Virtual environment not created properly"
      echo "Abort Install"
      exit 1
  fi


  # Install python libraries in the virtualenv

  source "${srcdir}/.venv/bin/activate"
  pip install --upgrade pip

  pip install --upgrade -r "${srcdir}/openai-client/requirements.txt"
  # pip install --upgrade PySide6
  # pip install --upgrade openai
  # pip install --upgrade pyinstaller


  # Convert python source code to executable using pyinstaller

  cd "${srcdir}/openai-client"
  pyinstaller -F "${srcdir}/openai-client/main.py"

  # cp -r "${srcdir}/dist/main" "${pkgdir}/opt/openai-client/binaries"
  install -Dm 755 "${srcdir}/openai-client/dist/main" "${pkgdir}/opt/openai-client/main"




}


