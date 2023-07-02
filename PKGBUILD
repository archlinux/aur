pkgname="openai-client-git"
_pkgname="openai-client"
pkgdesc="OpenAI client made using PySide6 Qt"
pkgver=1.0.r62.9e6f6e4
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

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/opt/openai-client"

  # install -Dm 755 "${srcdir}/openai-client/scripts/launchers/launch_arch.sh" "${pkgdir}/usr/bin/openai-client"
  install -Dm 755 "${srcdir}/openai-client/scripts/run.sh" "${pkgdir}/usr/bin/openai-client"

  icon_sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256")
  for icon_size in ${icon_sizes[@]}; do 
    echo $icon_size
    install -D "${srcdir}/openai-client/icons/${icon_size}.png"  "${pkgdir}/usr/share/icons/hicolor/${icon_size}/apps/openai-client.png"

  done




  install -D "${srcdir}/openai-client/desktop/openai-client.jpg" "${pkgdir}/usr/share/icons/openai-client.jpg"  
  install -D "${srcdir}/openai-client/desktop/openai-client.desktop" "${pkgdir}/usr/share/applications/openai-client.desktop"  


  # Create python virtualenv

  # pip install --upgrade pip
  # pip install --upgrade venvs
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

  cd "${srcdir}/openai-client"
  pyinstaller -F "${srcdir}/openai-client/main.py"

  # cp -r "${srcdir}/dist/main" "${pkgdir}/opt/openai-client/binaries"
  install -Dm 755 "${srcdir}/openai-client/dist/main" "${pkgdir}/opt/openai-client/main"




}


