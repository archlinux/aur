# Changelog


## 3.4.2 (2020-12-19)

### Changes

* Remove tests for python < 3.6. [Michele Tessaro]

  Python versions before 3.6 are now at end of life.
  `plantuml-markdown` will not be tested with those versions, and bugs
  will be fixed only if reproducible with more recent Python versions.

### Fix

* Fixed working with Markdown 3.3 (fixes #39) [Michele Tessaro]

* Fixed indentation handling (fixes #51) [Michele Tessaro]


## 3.4.1 (2020-10-28)

### Fix

* Fixed multiple mixed code blocks (fixes #45) [Michele Tessaro]

  Fixed parsing of mixed `fenced_code` and `plantuml_markdown` blocks in
  the same document.


## 3.4.0 (2020-08-23)

### New

* Capability to keep both inline and source data (implements #47) [Ihsan Topaloglu]

  As per discussed on https://github.com/mikitex70/plantuml-markdown/issues/47

### Changes

* Updated CHANGELOG.md. [Michele Tessaro]

* Update README.md (refs #47) [Ihsan Topaloglu]

* Update README.md (refs #47) [Ihsan Topaloglu]

  Readme update for the `source` inclusion feature that came with https://github.com/mikitex70/plantuml-markdown/releases/tag/3.3.0

### Fix

* Fixed uml code inside fenced code (fixes #45) [Michele Tessaro]

  UML source diagram inside a fenced code is now leaved untouched.


## 3.3.0 (2020-06-18)

### New

* Added support for loading plantuml from external files (refs #42) [Chalmela, Ravi]

### Changes

* Updated documentation. [Michele Tessaro]

* Updated documentation. [Michele Tessaro]

### Fix

* Fixed closing of object tag (fixes #44) [Michele Tessaro]


## 3.2.2 (2020-03-04)

### Fix

* Removed forgotten log level set to debug (fixes #41) [Michele Tessaro]


## 3.2.1 (2019-12-13)

### New

* Added support for Python 3.8. [Michele Tessaro]


## 3.2.0 (2019-12-08)

### New

* Added `priority` option to change plugin priority (refs #38) [Michele Tessaro]

  Now the plugin execution priority can be changed if you don't like
  default value.
  The default should be the most reasonable with most plugins.

### Changes

* Updated changelog. [Michele Tessaro]

* Documented how to set plantuml include search path (refs #37) [Michele Tessaro]


## 3.1.4 (2019-11-13)

### New

* Expand "~" in cachedir config. [Jean Jordaan]

### Changes

* Updated changelog for the new release. [Michele Tessaro]

### Fix

* Fixed special characters handling in alt and title (fixes #70) [Michele Tessaro]

* Fix brackets. [Jean Jordaan]


## 3.1.3 (2019-08-26)

### Changes

* Updated changelog for the new release. [Michele Tessaro]

* Updated changelog fot the new release. [Michele Tessaro]

### Fix

* Fix rendering in indented blocks (fixes #31) [Grzegorz Adamiak]

  It fixes [issue][31] with rendering indented fenced blocks. They were
  rendered only when put at beginning of the line. To illustrate, this
  block was processed correctly

      ```plantuml
      A --> B : I am processed
      ```

  while a block nested under a list item (indented) was not processed

        * A list item with nested block

          ```plantuml
          A --> B : I am not processed
          ```

  [31]: https://github.com/mikitex70/plantuml-markdown/issues/31

  With this patch the block is converted into image and correctly put in
  the document tree allowing for images nested in other block elements,
  e.g. list items.


## 3.1.2 (2019-06-01)

### Fix

* Fixed pip installable packages (fixes #29, #30) [Michele Tessaro]


## 3.1.1 (2019-05-29)

### Fix

* Fixed compatibility with Markdown 2 (refs #29) [Michele Tessaro]


## 3.1.0 (2019-05-02)

### New

* Added diagram caching (implements #27) [Michele Tessaro]

  To activate caching define the configuration option `cachedir`.
  See the `README.md` for some detail.

### Changes

* Update changelog for the new release. [Michele Tessaro]

* Added installation instructions for `chocolatey` (refs #28) [Michele Tessaro]


## 3.0.0 (2019-03-31)

### New

* Allow percent sign in width and height options. [Mathias Lüdtke]

### Changes

* Updated documentation for new release. [Michele Tessaro]

### Fix

* Renamed module to `plantuml_markdown` (fixes #23) [Michele Tessaro]

  Renamed module from `plantuml-markdown` to `plantuml_markdown` to allow
  importing module in other python sources.
  Thi breaks compatibility: plugin configuration in `markdown_py` must be
  renamed too.


## 2.0.2 (2019-03-16)

### Changes

* Updated documentation for new release. [Michele Tessaro]

### Fix

* Fixed handling of unicode characters in svg_inline (refs #21) [Szymon Wilkołazki]


## 2.0.1 (2019-03-03)

### Changes

* Updated documentation for the new release. [Michele Tessaro]

### Fix

* Fixed package contents. [Michele Tessaro]


## 2.0.0 (2019-03-02)

### New

* Added support for use a plantuml server (implements #19) [Michele Tessaro]

  Now for the diagram rendering can be used an external PlantUML server.
  This can speedup document generation when there are a lot of diagrams.

### Changes

* Updated documentation for new release. [Michele Tessaro]

### Fix

* Use preprocessors.register instead of (deprecated) add. [Johan]

* Fixed usage syntax. [Michele Tessaro]

  The `width` and `height` options are marked as optional.


## 1.4.0 (2018-11-24)

### New

* Added `width` and `height` attributes. [Michele Tessaro]

  The new attributes `width` and `height` can be used to limit image size:
  if the image dimension is bigger than values specified, they will be
  shrinked keeping the aspect ratio.
  If there is not enought space in the page fot the diagram, the image
  will be reduced.

### Changes

* Updated documentation for new release. [Michele Tessaro]

### Fix

* Fixed navigable links in inline SVG (resolves #18) [Michele Tessaro]


## 1.3.0 (2018-11-17)

### New

* Added support for clickable SVGs (closes #17) [Michele Tessaro]

  Added two new output formats:
  * `svg_object`: generated an `object` tag for displaing svg images
  * `svg_inline`: embedded the svg source image directly in the document

### Fix

* Fixed error when the output format is not recognized. [Michele Tessaro]


## 1.2.6 (2018-11-04)

### Changes

* Update documentation. [Michele Tessaro]

### Fix

* Fixed wrong `classes` HTML attribute (fixes #16) [Michele Tessaro]

  Fixed a type on the generated HTML code, the `class` attribute was
  mispelled to `classes`.


## 1.2.5 (2018-08-27)

### Fix

* Fixed running on Windows (refs #11) [Michele Tessaro]

  Thanks to henn1001 to pointing out a problem on Windows. See
  https://github.com/mikitex70/plantuml-markdown/issues/11#issuecomment-414057579
  for details.


## 1.2.4 (2018-07-15)

### New

* Added configuration for deployment to pypi and install with pip. [Michele Tessaro]

* Added configuration for deployment to pypi and install with pip. [Michele Tessaro]

### Changes

* Changes python-markdown project URL. [Fred Z]

### Fix

* Fixed package build for pip installation. [Michele Tessaro]


## 1.2.3 (2018-04-19)

### New

* Added some test. [Michele Tessaro]

* Added title macro option. [Michele Tessaro]

  Added a title option which would be used for generating the title
  (tooltip) of the diagrams in HTML rendering.

* Added GitLab compatibility (closes #7) [Michele Tessaro]

  Now the block diagram may be delimited also with the triple backtick
  character used in GitLab and others to delimit code blocks.
  See the README.md for more details.

* Added output path existence check. [Michele]

* Added source code. [Michele]

  Python-Markdown plugin for PlantUML.

### Fix

* Fixed running wiith Python 2.7. [Michele Tessaro]

* Fixed test execution with travis-ci. [Michele Tessaro]

* Fixed working with the fenced_code plugin (refs #8) [Michele Tessaro]

  Fixed diagram generation when used together with the fenced_code plugin.

* Fixed one-block diagrams parsing (fixes #9, #10) [Michele Tessaro]

  One block diagrams (without at least one empty line inside) were not
  correctly recognised.

* Minor fix in documentation. [Michele Tessaro]

* Fixed unicode characters in the macro options. [Michele Tessaro]

  Macro options parsing now will work correctly when using unicode
  characters (for example in the alt options).

* Fixed generation of class and alt image attributes. [Michele Tessaro]

  Images in the generated HTML were missing for the class and alt
  attributes.

* Fix an error with svg format. [jumpei-miyata]

* Fix regular expression. [jumpei-miyata]

* Some minor fixes. [Michele Tessaro]

  * base64 encoded SVGs, as Firefox doesn't handles plain SVGs
  * fixed the need of 2 empty lines for 'txt' diagrams
  * fixed newlines converted into br tags for 'txt' diagrams

* Correct path exists test. [Benjamin Henriet]

* Small documentation correction. [Michele]

* Little correction in documentation. [Michele]

* Some correction in markdown documentation syntax. [Michele]

* Some correction to documentation. [Michele]

### Other

* Removed the (useless) remove of the last line of source text block. [Michele Tessaro]

* Use inline images, NO MORE TEMPFILES!  Experimental 'txt' support. [kubilus1]

* Implemented a sort of caching for generated images. [Michele Tessaro]

  Image names are build from an hash code based on the diagram source.
  If the source diagram changes, the image maybe different and will be
  re-generated.
  Now images are generated only if not already present.

* Remove self from static method. [Benjamin Henriet]

* Remove self param from static method, diable image renaming/removing. [arye]

* Updated documentation for installation. [Michele]

  Added details on installing locally or globally.

* Adapted to work with Python 3. [Michele]

* Registered plugin after code block parser. [Michele]

  Registering the plugin after the code parser gives the possibility to
  write source uml code without being handled by this plugin and to
  present it as any other source code example.

* Keep temporary file if PlantUML fails. [Michele]

  The temporary file containing the PlantUML script can be used to
  identify syntax errors in the source MD document

* Initial commit. [Michele Tessaro]


