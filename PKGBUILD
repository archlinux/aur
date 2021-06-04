# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=stlink-server
pkgver=2.0.2
pkgrel=1
pkgdesc='The ST-LINK server it is a debugging tool and a monitoring tool for st chips like stm32 family.'
arch=('x86_64')
license=('Custom')
url='https://www.st.com/en/development-tools/st-link-server.html'

provides=('stlink-server')

prepare() {

  if [ ! -f /tmp/en.st-link-server.zip ]; then
    echo -e "\E[1;31mFile en.st-link-server.zip not found in the /tmp" \
      "directory! \E[0m\nPlease open https://www.st.com/en/development-tools/st-link-server.html and" \
      "download en.st-link-server.zip file.\nCopy en.st-link-server.zip to /tmp/en.st-link-server.zip" \
      "with command\E[1;33m cp -f en.st-link-server.zip /tmp/en.st-link-server.zip\E[0m and start build again!"
    exit 1
  fi

  unzip -o /tmp/en.st-link-server.zip -d "${srcdir:?}"

}

build() {

  cd "${srcdir}/en.st-link-server" || (
    echo -e "\E[1;31mBuild Failed! \E[0mCan't cd to ${srcdir}/en.st-link-server directory! Perhaps unzip is not" \
    "installed or the /tmp/en.st-link-server.zip archive is damaged! Please try install unzip and download again" \
    "en.st-link-server.zip file!"
    exit 1
  )

  sh "st-stlink-server.${pkgver}-${pkgrel}-linux-amd64.install.sh" --noexec

  makeself_dir=$(find . -type d -name "makeself_dir*" | head -n 1)

  if [[ ! -f "${srcdir:?}/en.st-link-server/${makeself_dir:?}/stlink-server"
  || ! -f "${srcdir:?}/en.st-link-server/${makeself_dir:?}/prompt_linux_license.sh" ]]; then
    echo -e "\E[1;31mBuild Failed! \E[0mSource directory ${srcdir}/en.st-link-server/${makeself_dir} not exist!"
    exit 1
  fi

  sh "${makeself_dir:?}/prompt_linux_license.sh"
  sed -n "/EOF/{:a;N;/^EOF\n/Ta};0,/EOF\n/D;p" "${makeself_dir:?}/prompt_linux_license.sh" > LICENSE
  cp -f "${makeself_dir:?}/stlink-server" stlink-server

}

package() {

  install -Dm644 "${srcdir:?}/en.st-link-server/LICENSE" "${pkgdir:?}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir:?}/en.st-link-server/stlink-server" "${pkgdir:?}/usr/bin/stlink-server"

}
