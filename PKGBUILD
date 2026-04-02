# Maintainer: attackuwu911 <daniil.baskakov13@gmail.com>

pkgname=python-accuralai-discord
pkgver=0.2.1
pkgrel=3
pkgdesc="AI-powered Discord bot package integrating AccuralAI orchestration"
arch=('any')
url="https://github.com/attackuwu911/accuralai"
license=('MIT')
depends=('python' 'python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')

prepare() {
    # Создаем чистую папку для исходников в рабочей директории
    mkdir -p "$srcdir/accuralai"
    
    # Копируем конфиги
    cp "$startdir/pyproject.toml" "$srcdir/"
    cp "$startdir/README.md" "$srcdir/"
    
    # Пытаемся найти файлы .py и положить их в пакет
    # Если они были в подпапке accuralai-0.2.1, берем оттуда
    if [ -d "$startdir/accuralai-0.2.1/accuralai" ]; then
        cp -r "$startdir/accuralai-0.2.1/accuralai/"* "$srcdir/accuralai/"
    elif [ -d "$startdir/accuralai" ]; then
        cp -r "$startdir/accuralai/"* "$srcdir/accuralai/"
    else
        # Если файлов нет в папках, ищем их прямо в корне
        cp "$startdir"/*.py "$srcdir/accuralai/" 2>/dev/null || :
    fi
}

build() {
    cd "$srcdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/lib/python3.14/site-packages/accuralai"
    cp -r "$startdir/accuralai/"* "$pkgdir/usr/lib/python3.14/site-packages/accuralai/"
}
