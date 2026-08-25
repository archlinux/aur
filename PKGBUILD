# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=borgwarehouse
pkgver=3.6.2
pkgrel=2
pkgdesc="WebUI for a BorgBackup central repository server"
arch=("x86_64")
url="https://github.com/ravinou/borgwarehouse"
license=('AGPL-3.0-or-later')
depends=(
  'bash'
  'borgbackup'
  'curl'
  'glibc'
  'jq'
  'libgcc'
  'libstdc++'
  'nodejs'
  'python'
)
optdepends=(
  'apprise' # apprise notifications from borgwarehouse
)
makedepends=(
  'pnpm'
)
backup=(
  "etc/webapps/${pkgname}/${pkgname}.env"
  "etc/webapps/${pkgname}/config/repo.json"
  "etc/webapps/${pkgname}/config/users.json"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-cron.service"
        "${pkgname}-cron.timer"
        "${pkgname}.service"
	      "${pkgname}.tmpfiles"
        "fix-env-nodocker.patch")
sha256sums=('981e43ab8f0f30717e8108c55a6533d3f1fc2b8ba6768e0780509c54bd406d23'
            'ce1a55c203eef3c65f186efc3ffa2bcf416de67e5586cf542edf199b8a9ec47a'
            '15bc6db13bfa17402ee07bb2f91711a0d84d298b3fbd3f48722345d4c19bb917'
            '1ca148f62f03cec0498194457568230e0a7e300add4788a600abd4b9a12f81ec'
            '4baf4a805e37db88b95506cdbdb59e97a0c4e7b59205917a2e8eb77c804bdc3d'
            '9c9a47658afd857d129567a990fb721aba8a1ba31e26e8278f5b8af1c3e5308b')
options=(!strip !debug)
install="borgwarehouse_nodynuser_migration.install"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "Adapting environment file"
  patch --forward --strip=1 --input=../fix-env-nodocker.patch
  echo "Adapting home directory in /helpers/shells/ scripts"
  sed -i 's#/home/borgwarehouse#/var/lib/borgwarehouse#g' ./helpers/shells/* && echo "OK"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "Running pnpm install"
  pnpm install --frozen-lockfile
  echo "Running pnpm run build"
  pnpm run build
  echo "Running pnpm prune --prod"
  pnpm prune --prod
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  echo "Cleaning up source dir"  
  rm -R .github .husky Containers docker tests 
  rm .commitlintrc.mjs .dockerignore .gitignore ./config/.gitkeep .npmrc .prettierrc.json .pre-commit-config.yaml Dockerfile docker-compose.yml eslint.config.mjs pnpm-lock.yaml pnpm-workspace.yaml vitest.config.ts 
  
  echo "Applying correct permissions"
  find './' -type d -name '.*'    -exec chmod 755 {} \;
  chmod 755 ./helpers/shells/*.sh
  
  echo "Packaging main app folder"
  install -dm 755 "${pkgdir}/usr/share/webapps/"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -dm 755 "${pkgdir}/etc/webapps/$pkgname"
  mv "${pkgdir}/usr/share/webapps/${pkgname}/.env.sample" "${pkgdir}/etc/webapps/${pkgname}/${pkgname}.env"
  ln -s "/etc/webapps/${pkgname}/${pkgname}.env" "${pkgdir}/usr/share/webapps/${pkgname}/.env"

  echo "Packaging config files"
  mv "${pkgdir}/usr/share/webapps/${pkgname}/config" "${pkgdir}/etc/webapps/${pkgname}/"
  ln -s "/etc/webapps/${pkgname}/config" "${pkgdir}/usr/share/webapps/${pkgname}/config"
  touch "${pkgdir}/etc/webapps/${pkgname}/config/repo.json"
  touch "${pkgdir}/etc/webapps/${pkgname}/config/users.json"

  echo "Packaging service and tmp- files"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-cron.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-cron.service"
  install -Dm644 "${srcdir}/${pkgname}-cron.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}-cron.timer"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

