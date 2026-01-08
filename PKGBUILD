# Maintainer: Your Name <your.email@example.com>
# Contributor: Saeed-Badrelden

pkgname=helfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A custom system information fetcher for Helwan Linux, inspired by Neofetch/Fastfetch."
arch=('any')
url="https://github.com/helwan-linux/helwan-fetch"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('git')
optdepends=()

_gitbranch="main"
source=("git+${url}.git#branch=${_gitbranch}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/helwan-fetch"

  # المجلد الأساسي داخل الريبو اسمه 'Helfetch'
  mv "Helfetch" "${srcdir}/_temp_helfetch_content_"

  cd "${srcdir}"
  rm -rf "helwan-fetch"

  mv "_temp_helfetch_content_" "${pkgname}"
}

package() {
  # تحديد مسار site-packages المناسب لإصدار بايثون الحالي
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # إنشاء مجلدات التثبيت
  install -d "${pkgdir}${_site_packages}"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"

  # نسخ باكيج helfetch إلى مجلد site-packages
  cp -r "${srcdir}/${pkgname}" "${pkgdir}${_site_packages}/"

  # إنشاء سكربت تشغيل في /usr/bin/helfetch
  echo -e '#!/bin/bash\npython -m helfetch' > "${pkgdir}/usr/bin/helfetch"
  chmod +x "${pkgdir}/usr/bin/helfetch"

  # Uncomment if LICENSE is added later
  # install -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

