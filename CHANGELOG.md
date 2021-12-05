# Changelog
## 1.7.0 (UNRELEASED)

### Enhancements
* Request lifetime instances with cleanup (using ContextManagers) for the FastApi integration.

### Bug Fixes
* Fixed bug which meant generator dependencies could not accept the container as an argument

### Backwards incompatible changes
None

## 1.6.0 (2021-11-25)

### Enhancements
* Starlette integration now has support for web sockets. #173. Thanks again @MisterKeefe
* FastApi integration provides method to support altering dependency chains during test.

### Bug Fixes
None

### Backwards incompatible changes
None

## 1.5.0 (2021-11-13)

### Enhancements
* Better error messages when failing to load environment variables.
* Starlette integration now supports class based endpoints #170 thanks @MisterKeefe

### Bug Fixes
None

### Backwards incompatible changes
None

## 1.4.1 (2021-09-17)

### Enhancements
None

### Bug Fixes
* Error messages with type names now consistent in upcoming python verson 3.10 (#167) 


### Backwards incompatible changes
None


## 1.4.0 (2021-08-16)

### Enhancements
* container.partial now works for instance methods. Thanks to @LeafyLappa for pointing out this didn't work.
* Added FunctionCollection type. Allows the container to store a collection of functions

### Bug Fixes
* container.partial now works for instance methods. Thanks to @LeafyLappa for pointing out this didn't work.

### Backwards incompatible changes
None

## 1.3.1 (2021-05-27)

### Enhancements
None

### Bug Fixes
* Fixed bug in flask integration where multiple route decorators caused an error
* Fixed bug with self aliases causing infinite recursion. Thanks to @mrogaski for the report. #159.

### Backwards incompatible changes
None

## 1.3.0 (2021-03-22)

### Enhancements
* Add experimental support for flask blueprints.

### Bug Fixes
None

### Backwards incompatible changes
None


## 1.2.1 (2021-03-21)

### Enhancements
None

### Bug Fixes
* Fixed a bug that could cause an aliased class to skip a defined way of constructing the class.
* Custom caching reflection logic replaced with lru cache. This prevents an in theory bug when the 
cache could fill up memory if a lot of temporary functions got reflected upon.

### Backwards incompatible changes
None

## 1.2.0 (2021-03-17)
### Enhancements
* FastAPI integration now provides request level singletons.
* [EXPERIMENTAL] Integration to click CLI package added

### Bug Fixes
None
### Backwards incompatible changes
* Internal detail: The type hints for FunctionSpec from the caching reflector are now all non-mutable.
The implementation is not changed but the immutable hints should prevent state based bugs.

## 1.1.0 (2021-02-24)

### Enhancements
* Classes can now be passed to container.partial and container.magic_partial. Thanks to @BrentSouza via PR #132.
* Decorators now preserve function docs.
* Decorators now communicate that the return type of the decorated function is preserved.

### Bug fixes
* Stop unnecessary function call to parent definitions.

### Backwards incompatible changes
None

## 1.0.0 (2021-01-19)
### Backwards incompatible changes from v0.20.0
* Framework integrations now require ExtendableContainer rather than readable. For most
  use cases this will require not change.
* Experimental django container is now modified to use a normal container and an integration
  class.
  
### Changes since last beta
#### Enhancements
* Added ability for ContainerDebugInfo to be injected.
* Provide argument to partial/magic_partial that updates the container 
  before triggering dependency resolution. This opens up a hook for framework
  integrations to supply things like the Request object.

## 1.0.0-beta.4 (2020-11-29)
### Bugfixes
* Fix ridiculous bug which meant pydantic was implicitly required.


## 1.0.0-beta.3 (2020-11-28)
### Bugfixes
* Undoes changes to injectable as this caused potential issues.

## 1.0.0-beta.2 (2020-11-28)

### Enhancements
* Various performance enhancements. 
* Bytes and Bytearray now in the non resolveable by default types.
* Fastapi & flask integrations now make the request available for injection
* Raise better exceptions if injectable is accidentally used.

### Bug fixes
None

### Backwards incompatible changes
* Framework integrations now require ExtendableContainer rather than readable. For most
use cases this will require not change.
* Experimental django container is now modified to use a normal container and an integration
class.


## 1.0.0-beta.1 (2020-11-21)
No changes from 0.20.0 but bumped to signal intention to freeze api.

### Enhancements
None

### Bug fixes
None

### Backwards incompatible changes
None

## 0.20.0 (2020-11-19)
### Enhancements
* Move explicit container out of the experimental namespace.
* Integrations are now no longer containers (except django but this may change before release).

### Bug fixes
None

### Backwards incompatible changes
* Integrations now work in a different way. Code will need to be updated. Refer to docs.

## 0.19.1 (2020-11-18)
### Enhancements
None

### Bug fixes
* Fix errors raised when trying to call a partial function with some arguments provided.

### Backwards incompatible changes
None

## 0.19.0 (2020-11-17)
### Enhancements
* Experimental ExplicitContainer has been made faster and returns more user friendly
errors.
* Context manager for working with temporary singletons added.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.18.1 (2020-10-23)
### Enhancements
* Better interface for build version info.

### Bug fixes
* fix but in retrieving the git hash from the package.

## 0.18.0 (2020-10-23)
### Enhancements
* (internal detail) when a plain object is provided to the container as a definition it is
no longer wrapped as a Singleton, but stored instead as PlainInstance. This allows the container
to skip any thread locks added in the singleton logic.
* add publishing logic to ship git commit hash with package.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.17.0 (2020-10-20)
### Enhancements
* Magic partial and regular partial binding for framework integrations
* Thread locks for mutable state in the caching reflector and the singletons.

### Bug fixes
None

### Backwards incompatible changes
* All framework binding methods are now non magic by default

## 0.16.1 (2020-08-31)
### Enhancements
* Better error on infinte loops in definitions.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.16.0 (2020-08-31)
### Enhancements
* The decorator `bind_to_container` and the function `partial` are now limited in what
they can inject. This is a backwards incompatible enhancement.

### Bug fixes
None

### Backwards incompatible changes
* The decorator `bind_to_container` and the function `partial` now require arguments
that are to be injected to be marked explicitly. The old behaviour is available through
`magic_bind_to_container` and `magic_partial`.   

## 0.15.0 (2020-07-09)
### Enhancements
* Moved the env loading out of experimental.
* Async dependencies can be loaded using await

### Bug fixes
None

### Backwards incompatible changes
* Env now no longer exists in the experimental module.

## 0.14.0 (2020-06-21)
### Enhancements
* Added extra requirements for env under `pip install lagom[env]`


### Bug fixes
* Fixed a bug that meant forward refs weren't handled 05a73109b4fe7b80c8cf2eee552a78f7535a56cc
* Fixed bug where typing self caused a loop and a crash d50fabea6f69863800b59fe730bd408432587851

### Backwards incompatible changes
None

## 0.13.0 (2020-06-10)
### Enhancements
* Add a property to the container and reflector giving debug information about what's been reflected.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.12.0 (2020-06-10)
### Enhancements
* More useful error messages when invocation of bound functions fails.
* Performance improvements around bound functions. Less invocation time reflection.

### Bug fixes
None

### Backwards incompatible changes
* Construction definition class has been removed (split into two classes but these should not be used externally)

## 0.11.1 (2020-06-01)
### Enhancements
None

### Bug fixes
* Fix issue with cloned containers losing the reflection cache

### Backwards incompatible changes
None

## 0.11.0 (2020-06-01)
### Enhancements
* All reflection results are now cached to improve perfomance

### Bug fixes
None

### Backwards incompatible changes
* Possible that any code that changed signatures dynamically is now broken as
  the cache will only ever return the original reflection.

## 0.10.0 (2020-05-30)
### Enhancements
* Add an experimental class to wrap up os.environ (built on on pydantic)
* allow dependency defition functions to yield instead of return

### Bug fixes
None

### Backwards incompatible changes
None


## 0.9.2 (2020-05-21)
### Enhancements
* Container has property which exposes list of defined types. 
* The experimental django integration now provides access to custom `Manager` objects.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.9.1 (2020-05-21)
### Enhancements
* Experimental explict container added. Requires a definition for every dependency (implements #38)

### Bug fixes
* Extracted bare exception into the namespaced exceptions (fixes #39)

### Backwards incompatible changes
None

## 0.9.0 (2020-05-15)
### Enhancements
None

### Bug fixes
* Bound functions now take supplied arguments over container generated ones. 

### Backwards incompatible changes
* The argument order on Container.partial has changed.
* Bound functions now take supplied arguments over container generated ones.

## 0.8.0 (2020-05-13)
### Enhancements
* Optional types are now handled. If they can be built they are. If not they are omitted.
* Add experimental django integration. 

### Bug fixes
* Error messages when a generic type couldn't be built in 3.6 now contain the full type name.

### Backwards incompatible changes
None

## 0.7.1 (2020-05-05)
### Enhancements
* Added an experimental way of defining functions as injected dependencies. This may not be kept and changes will
not be considered breaking.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.7.0 (2020-05-03)

### Enhancements
* Tidied up logic around singletons, aliases and constructors.
* Documentation and doc testing of more methods

### Bug fixes
None

### Backwards incompatible changes
* Subtle changes to lots of container interfaces. No "normal" code should require changes.

## 0.6.7 (2020-02-07)

### Enhancements
* Request level singletons are enabled for starlette & flask integrations.

### Bug fixes
* Fix bug that meant singleton construction couldn't reference container.

### Backwards incompatible changes
None

## 0.6.6 (2020-02-06)

### Enhancements
* Basic introspection properties are kept in bound functions

### Bug fixes
None

### Backwards incompatible changes
None

## 0.6.5 (2020-02-06)

### Enhancements
* Flask integration provided

### Bug fixes
None

### Backwards incompatible changes
None

## 0.6.4 (2020-02-04)

### Enhancements
* Added explicit support for python 3.6 (required no actual code changes)

### Bug fixes
None

### Backwards incompatible changes
None

## 0.6.3 (2020-02-04)

### Enhancements
* Provide extended container that integrates well with fastapi.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.6.2 (2020-02-04)

### Enhancements
* Better error messages if a List[X] like type can't be fufilled.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.6.1 (2020-02-04)

### Enhancements
* Provide extended container that integrates well with starlette.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.6.0 (2020-02-04)

### Enhancements
* Expose a richer type definition when registering dependencies. This is a
design goal after all.

### Bug fixes
None

### Backwards incompatible changes
* The strong type definition *could* cause errors in existing code.

## 0.5.4 (2020-02-04)

### Enhancements
None

### Bug fixes
* Fix bug causing bound functions to resolve dependencies at definition time.

### Backwards incompatible changes
None

## 0.5.5 (2020-02-04)

### Enhancements
* Better error handling

### Bug fixes
None

### Backwards incompatible changes
None

## 0.5.3 (2020-02-04)

### Enhancements
None

### Bug fixes
* Fix async binding with invocation level singletons so that they pass iscoroutinefunction

### Backwards incompatible changes
None

## 0.5.2 (2020-02-04)

### Enhancements
* Async defs are now bindable.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.5.1 (2020-02-04)

### Enhancements
* The result of binding to a container will now pass `inspect.is_function`

### Bug fixes
None

### Backwards incompatible changes
None

## 0.5.0 (2020-02-04)

### Enhancements
* Singleton bool for `dependency_definition` decorator
* Invocation level singletons are now lazily loaded

### Bug fixes
None

### Backwards incompatible changes
* Invocation level singletons are now lazily loaded

## 0.4.1 (2020-02-03)

### Enhancements
* Invocation level caching for decorated functions

### Bug fixes
None

### Backwards incompatible changes
None

## 0.4.0 (2020-02-03)

### Enhancements
* Added `dependency_definition` decorator to handle log construction logic
* Error is raised if the same typed is defined twice.

### Bug fixes
* All container instances no longer share the same state.

### Backwards incompatible changes
* It's now no longer possible to overwrite existing definitions.

## 0.3.2 (2019-08-18)

### Enhancements
* Simplified decorator for partial functions that now allows 
positional argument calls.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.3.1 (2019-07-10)

### Enhancements
* Better documentation and testing for partially bound functions.

### Bug fixes
None

### Backwards incompatible changes
None

## 0.3.0 (2019-07-01)

### Enhancements
* Support for generators as partially bound functions

### Bug fixes
* Fixed handling around partial functions.

### Backwards incompatible changes
None

## 0.2.0 (2019-06-06)

### Enhancements
- Arity 1 constructor functions allowed and are passed the container.

### Bug fixes
None

### Backwards incompatible changes
None
