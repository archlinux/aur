pkgname="openai-client-git"
pkgdesc="OpenAI client made using PySide6 Qt"
pkgver="1.0.0"
pkgrel=1
arch=("x86_64")


license=('MIT')


# binaries in virtual environment will be removed
# if default behaviour makepkg is not overridden
options=(!strip)

# use pacman -Qs "package-name"
depends=("git>=2.0" "python>=3.5" "python-pip>=20.0")

provides=("openai-client")

# backup=(etc/$pkgname/{config.ini,wsetup.sh,xsetup.sh})
# backup=(~/.config/openai-client)
# backup=(home/${USER}/.config/openai-client)

source=("git+https://github.com/awesomeDev12/openai-client.git"
        "launch_arch.sh")

# sha512sums=("SKIP")
sha512sums=("SKIP" "SKIP")

package() {

  # Make necessary directories

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/opt/openai-client"

  cp "${srcdir}/launch_arch.sh" "${pkgdir}/usr/bin/openai-client"

  cp "${srcdir}/openai-client/desktop/openai-client.jpg" "${pkgdir}/usr/share/icons/openai-client.jpg"  
  cp "${srcdir}/openai-client/desktop/openai-client.desktop" "${pkgdir}/usr/share/applications/openai-client.desktop"  


  # Create python virtualenv

  pip install --upgrade pip
  pip install --upgrade venvs
  mkdir -p venv "${srcdir}/.venvs"
  python -m venv "${srcdir}/.venvs/openai-client-venv"


  # Check if virtualenv is created
  if [ -f "${srcdir}/.venvs/openai-client-venv/bin/activate" ]; then
      echo "Good to go"
      echo "Python virtualenv created properly"
  else
      echo "Virtual environment not created properly"
      echo "Abort Install"
      exit 1
  fi


  # Install python libraries in the virtualenv

  source "${srcdir}/.venvs/openai-client-venv/bin/activate"
  pip install --upgrade pip

  pip install --upgrade -r "${srcdir}/openai-client/requirements.txt"
  # pip install --upgrade PySide6
  # pip install --upgrade openai
  # pip install --upgrade pyinstaller


  # Convert python source code to executable using pyinstaller

  cd "${srcdir}"
  pyinstaller "${srcdir}/openai-client/main.py"

  cp -r "${srcdir}/dist/main" "${pkgdir}/opt/openai-client/binaries"


  chmod +x "${pkgdir}/usr/bin/openai-client"



}


