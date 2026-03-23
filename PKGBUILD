# Maintainer: pharmaracist <pharmaracist@github>
pkgname=noon-mirsald
pkgver=1.0.0
pkgrel=1
pkgdesc="مرسال — Noon native messaging host daemon for browser download interception"
arch=('any')
url="https://github.com/pharmaracist/mirsal"
license=('MIT')
depends=('python')
source=()
sha256sums=()

package() {
    install -dm755 "${pkgdir}/usr/lib/noon-mirsal"
    install -dm755 "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"

    cat > "${pkgdir}/usr/lib/noon-mirsal/mirsald" << 'SCRIPT'
#!/usr/bin/env python3
import sys
import json
import struct
import subprocess
import os

def read_message():
    raw = sys.stdin.buffer.read(4)
    if not raw or len(raw) < 4:
        sys.exit(1)
    length = struct.unpack('<I', raw)[0]
    return json.loads(sys.stdin.buffer.read(length))

def write_message(obj):
    data = json.dumps(obj).encode()
    sys.stdout.buffer.write(struct.pack('<I', len(data)))
    sys.stdout.buffer.write(data)
    sys.stdout.buffer.flush()

msg = read_message()

if msg.get("type") == "downloads.add":
    payload  = msg.get("payload", {})
    url      = payload.get("url", "")
    filename = payload.get("filename", "").split("/")[-1] or url.split("/")[-1]
    dest     = os.path.join(os.path.expanduser("~"), "Downloads", filename)
    subprocess.run(["noon", "ipc", "call", "global", "download", url, dest, filename])

write_message({"status": "ok"})
SCRIPT

    chmod 755 "${pkgdir}/usr/lib/noon-mirsal/mirsald"

    cat > "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/noon_mirsal.json" << 'MANIFEST'
{
    "name": "noon_mirsal",
    "description": "مرسال — Noon native messaging host",
    "path": "/usr/lib/noon-mirsal/mirsald",
    "type": "stdio",
    "allowed_extensions": ["mirsal@noon"]
}
MANIFEST
}
