# Licensing

This repository contains **only build instructions** (`PKGBUILD` and docs).
It does **not** contain the Widevine binary.

## 1. Build instructions in this repository (0BSD)

The `PKGBUILD`, `README.md`, and other files authored for this package are
licensed under the [0BSD license](https://spdx.org/licenses/0BSD.html),
as recommended by the Arch package guidelines for AUR submissions:

```text
Copyright (C) 2025-2026 by the helium-widevine contributors
(mary-ext, JJDizz1L and others).

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

## 2. Widevine CDM (proprietary, NOT redistributed here)

The Widevine Content Decryption Module downloaded at build time from
`https://www.google.com/dl/release2/chrome_component/...` is:

```text
Copyright Google LLC and its affiliates. All rights reserved.

You may not use, modify, sell, or otherwise distribute the Software
without a separate license agreement with Google. The Software is not
open source software.
```

- Source: Google Chrome Component distribution, `license=('custom')`.
- The `package()` step installs Google's own `LICENSE` file to
  `/usr/share/licenses/helium-widevine/LICENSE` on the target system.
- Building this package downloads the CDM directly from Google to your
  machine. Use is subject to Google's / Widevine's terms
  (see https://www.widevine.com/). This project is not affiliated with
  Google or the Helium Browser authors.
- Do not re-upload `libwidevinecdm.so`, the `.crx3`, or built
  `.pkg.tar.zst` files to public file hosts — that would be redistribution,
  which the Widevine license prohibits. Distribute the `PKGBUILD`, not
  the binary.
