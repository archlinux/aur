.. :changelog:

Changelog
=========

Versions are year-based with a strict backward compatibility policy.
The third digit is only for regressions.


21.2.0 (2021-04-07)
-------------------

Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*none*


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- Added support for ``pem.OpenSSLTrustedCertificate`` (``-----BEGIN TRUSTED CERTIFICATE-----``), as defined in `openssl x509 manual <https://www.openssl.org/docs/man1.1.1/man1/x509.html>`_.
  `#28 <https://github.com/hynek/pem/issues/28>`_


----


21.1.0 (2021-01-22)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*none*


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- Added support for DSA private keys (``BEGIN DSA PRIVATE``).
  This is also the OpenSSH legacy PEM format.
  `#49 <https://github.com/hynek/pem/issues/49>`_
- Added support for ``pem.SSHPublicKey`` (``---- BEGIN SSH2 PUBLIC KEY ----``), as defined in `RFC 4716 <https://tools.ietf.org/html/rfc4716>`_.
  `#46 <https://github.com/hynek/pem/pull/46>`_
- Added support for ``pem.SSHCOMPrivateKey`` (``---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----``), the SSH.com / Tectia private key format (plain or encrypted).
  `#46 <https://github.com/hynek/pem/pull/46>`_


----


20.1.0 (2020-01-06)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*none*


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- Carriage returns (``\r``) are now stripped before hashing *pem* objects to provide consistent hashes across platforms.
  `#40 <https://github.com/hynek/pem/issues/40>`_


----


19.3.0 (2019-10-16)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Python 3.4 is not supported anymore.
  It has been unsupported by the Python core team for a while now and its PyPI downloads are negligible.

  It's very unlikely that *pem* will break under 3.4 anytime soon, but we don't test it anymore.


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- Added support for ``pem.OpenSSHPrivateKey`` (``OPENSSH PRIVATE KEY``).
  OpenSSH added a new ``BEGIN`` label when it switched to a proprietary key encoding.
  `#39 <https://github.com/hynek/pem/pull/39>`_


----


19.2.0 (2019-08-06)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*none*


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- Added support for ``pem.ECPrivateKey`` (``EC PRIVATE KEY``).


----


19.1.0 (2019-03-19)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*none*


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- You can now load encrypted PKCS#8 PEM key as ``pem.Key``.
- Added support for ``pem.PublicKey`` (``PUBLIC KEY``).
- Added support for ``pem.RSAPublicKey`` (``RSA PUBLIC KEY``).


----


18.2.0 (2018-10-09)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*none*


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- Added ``pem.CertificateRevocationList`` for certificate revocation lists (CRLs).
  `#32 <https://github.com/hynek/pem/pull/32>`_


----


18.1.0 (2018-06-23)
-------------------


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- ``pem.certificateOptionsFromFiles()`` and ``pem.certificateOptionsFromPEMs()`` have been removed after three years of deprecation.
  Please use ``pem.twisted.certificateOptionsFromFiles()`` ``pem.twisted.certificateOptionsFromPEMs()`` instead.
- Diffie-Hellman support for Twisted older than 14.0 has been removed.


Deprecations:
^^^^^^^^^^^^^

*none*


Changes:
^^^^^^^^

- *pem* now ships with typing information that can be used by type checkers like `mypy <http://mypy-lang.org>`_.
- PEM objects now have an ``obj.sha1_hexdigest`` property with the SHA-1 digest of the stored bytes  as a native string.
  This is the same digest as the one that is used by the PEM objects' ``__repr__``\ s.
- PEM objects now have an ``obj.as_text()`` method that returns the PEM-encoded content as unicode, always.


----


17.1.0 (2017-08-10)
-------------------


Changes:
^^^^^^^^

- Added ``pem.CertificateRequest`` for `certificate signing requests <https://en.wikipedia.org/wiki/Certificate_signing_request>`_.
  `#29 <https://github.com/hynek/pem/pull/29>`_


----


16.1.0 (2016-04-08)
-------------------

Deprecations:
^^^^^^^^^^^^^

- Passing ``dhParameters`` to ``pem.twisted.certifateOptionsFromPEMs`` and ``certificateOptionsFromFiles`` is now deprecated;
  instead, include the DH parameters in the PEM objects or files.


Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Python 3.3 and 2.6 aren't supported anymore.
  They may work by chance but any effort to keep them working has ceased.

  The last Python 2.6 release was on October 29, 2013 and isn't supported by the CPython core team anymore.
  Major Python packages like Django and Twisted dropped Python 2.6 a while ago already.

  Python 3.3 never had a significant user base and wasn't part of any distribution's LTS release.


Changes:
^^^^^^^^

- ``pem.twisted.certificateOptionsFromPEMs`` and ``certificateOptionsFromFiles`` will now load Ephemeral Diffie-Hellman parameters if found.
  `#21 <https://github.com/hynek/pem/pull/21>`_
- PEM objects now correctly handle being constructed with unicode and bytes on both Python 2 and 3.
  `#24 <https://github.com/hynek/pem/pull/24>`_
- PEM objects now have an ``as_bytes`` method that returns the PEM-encoded content as bytes, always.
  `#24 <https://github.com/hynek/pem/pull/24>`_
- PEM objects are now hashable and comparable for equality.
  `#25 <https://github.com/hynek/pem/pull/25>`_



----


16.0.0 (2016-02-05)
-------------------

Changes:
^^^^^^^^

- PKCS #8 keys are now supported.
  `#14 <https://github.com/hynek/pem/pull/14>`_
- *pem* is now fully functional without installing Twisted.
  `#16 <https://github.com/hynek/pem/pull/16>`_


----


15.0.0 (2015-07-10)
-------------------

Deprecations:
^^^^^^^^^^^^^

- The usage of Twisted helpers from the pem module is deprecated.
  Use their pendants from the ``pem.twisted`` module now.
- The usage of the backport of ephemeral Diffie-Hellman support is hereby deprecated.
  Nobody should use a Twisted release that is older than 14.0.0 because it contains essential SSL/TLS fixes.


Changes:
^^^^^^^^

- Support PEM strings that do not end with a new line.
  `#12 <https://github.com/hynek/pem/pull/12>`_
- Support PEM strings that end with ``\r\n``.
- The Twisted-related helpers have been moved to ``pem.twisted``.


----


0.3.0 (2014-04-15)
------------------

Changes:
^^^^^^^^

- Load PEM files as UTF-8 to allow for non-ASCII comments (like in certifi).
- Allow keys, primary certificates, and chain certificates to occur in any order.


----


0.2.0 (2014-03-13)
------------------

Changes:
^^^^^^^^

- Add forward-compatible support for DHE.


----


0.1.0 (2013-07-18)
------------------

Initial release.
